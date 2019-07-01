Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D76EE7D3E0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 08:40:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x618ehwq003353
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Jul 2019 01:40:43 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 1 Jul 2019 01:40:43 -0700
To: Pierre Le Magourou <lemagoup@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20190627145917.1774-1-lemagoup@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <6ab87120-92d4-7cbc-e88a-8e9261037901@windriver.com>
Date: Mon, 1 Jul 2019 16:41:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190627145917.1774-1-lemagoup@gmail.com>
Subject: Re: [meta-oe][PATCH v5] cve-update-db: do_populate_cve_db depends on do_fetch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Jul 2019 08:40:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Pierre,

This patch broke "bitbake universe --runall=fetch" totally:

ERROR: Running idle function
Traceback (most recent call last):
   File "/buildarea1/lyang1/poky/bitbake/lib/bb/runqueue.py", line 1500, in 
RunQueue.execute_runqueue():
              try:
     >            return self._execute_runqueue()
              except bb.runqueue.TaskFailure:
   File "/buildarea1/lyang1/poky/bitbake/lib/bb/runqueue.py", line 1420, in 
RunQueue._execute_runqueue():
                                                                  [43, 967, 4, 
3, 1, 5, 3, 7, 13, 1, 2, 1, 1, 246, 35, 1, 38, 1, 35, 2, 338, 204, 142, 3, 3, 
37, 244])
     >            if self.rqdata.prepare() == 0:
                      self.state = runQueueComplete
   File "/buildarea1/lyang1/poky/bitbake/lib/bb/runqueue.py", line 906, in 
RunQueueData.prepare():
                      for tid in list(runall_tids):
     >                    mark_active(tid,1)

   File "/buildarea1/lyang1/poky/bitbake/lib/bb/runqueue.py", line 837, in 
mark_active(tid='/buildarea1/lyang1/poky/meta/recipes-core/meta/cve-update-db.bb:do_fetch', 
depth=1):
                  for depend in depends:
     >                mark_active(depend, depth+1)

   File "/buildarea1/lyang1/poky/bitbake/lib/bb/runqueue.py", line 835, in 
mark_active(tid='/buildarea1/lyang1/poky/meta/recipes-core/meta/cve-update-db.bb:do_populate_cve_db', 
depth=2):

     >            depends = self.runtaskentries[tid].depends
                  for depend in depends:
KeyError: 
'/buildarea1/lyang1/poky/meta/recipes-core/meta/cve-update-db.bb:do_populate_cve_db'


The line which caused the problem is:
addtask do_populate_cve_db before do_fetch

Would you please fix it? Or I can help if needed.

// Robert


On 6/27/19 10:59 PM, Pierre Le Magourou wrote:
> From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
> 
> To be able to populate NVD database on a fetchall
> (bitbake <image> --run-all=fetch), set the do_populate_cve_db task to be
> executed before do_fetch.
> 
> Do not get CVE_CHECK_DB_DIR, CVE_CHECK_DB_FILE and CVE_CHECK_TMP_FILE
> variable because do_populate_cve_db can be called in a context where
> cve-check class is not loaded.
> 
> Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
> ---
>   meta/recipes-core/meta/cve-update-db.bb | 21 +++++++++++++--------
>   1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/recipes-core/meta/cve-update-db.bb b/meta/recipes-core/meta/cve-update-db.bb
> index 4c896dc880..3e5bae8b1d 100644
> --- a/meta/recipes-core/meta/cve-update-db.bb
> +++ b/meta/recipes-core/meta/cve-update-db.bb
> @@ -6,7 +6,6 @@ PACKAGES = ""
>   
>   inherit nopackages
>   
> -deltask do_fetch
>   deltask do_unpack
>   deltask do_patch
>   deltask do_configure
> @@ -24,11 +23,16 @@ python do_populate_cve_db() {
>   
>       BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
>       YEAR_START = 2002
> -    JSON_TMPFILE = d.getVar("CVE_CHECK_DB_DIR") + '/nvd.json.gz'
> +
> +    db_dir = d.getVar("DL_DIR") + '/CVE_CHECK'
> +    db_file = db_dir + '/nvd-json.db'
> +    json_tmpfile = db_dir + '/nvd.json.gz'
>       proxy = d.getVar("https_proxy")
>   
> +    if not os.path.isdir(db_dir):
> +        os.mkdir(db_dir)
> +
>       # Connect to database
> -    db_file = d.getVar("CVE_CHECK_DB_FILE")
>       conn = sqlite3.connect(db_file)
>       c = conn.cursor()
>   
> @@ -55,9 +59,9 @@ python do_populate_cve_db() {
>               req = urllib.request.Request(json_url)
>               if proxy:
>                   req.set_proxy(proxy, 'https')
> -            with urllib.request.urlopen(req) as r, open(JSON_TMPFILE, 'wb') as tmpfile:
> +            with urllib.request.urlopen(req) as r, open(json_tmpfile, 'wb') as tmpfile:
>                   shutil.copyfileobj(r, tmpfile)
> -            with gzip.open(JSON_TMPFILE, 'rt') as jsonfile:
> +            with gzip.open(json_tmpfile, 'rt') as jsonfile:
>                   update_db(c, jsonfile)
>               c.execute("insert or replace into META values (?, ?)",
>                       [year, last_modified])
> @@ -65,8 +69,9 @@ python do_populate_cve_db() {
>       conn.commit()
>       conn.close()
>   
> -    with open(d.getVar("CVE_CHECK_TMP_FILE"), 'a'):
> -        os.utime(d.getVar("CVE_CHECK_TMP_FILE"), None)
> +    cve_check_tmp_file =  d.getVar("TMPDIR") + '/cve_check'
> +    with open(cve_check_tmp_file, 'a'):
> +        os.utime(cve_check_tmp_file, None)
>   }
>   
>   # DJB2 hash algorithm
> @@ -120,7 +125,7 @@ def update_db(c, json_filename):
>   
>   
>   
> -addtask do_populate_cve_db before do_cve_check
> +addtask do_populate_cve_db before do_fetch
>   do_populate_cve_db[nostamp] = "1"
>   
>   EXCLUDE_FROM_WORLD = "1"
> 

