Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6B5967F8C1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 16:52:03 +0000 (UTC)
Received: from Marks-MacBook-Pro.local ([76.164.61.198]) (authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id xAIGptXl014835
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO); Mon, 18 Nov 2019 10:51:56 -0600
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20191118164647.29409-1-ross.burton@intel.com>
	<20191118164647.29409-3-ross.burton@intel.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <e71d45db-2419-5b35-5fc7-2f599a06e717@kernel.crashing.org>
Date: Mon, 18 Nov 2019 10:51:54 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191118164647.29409-3-ross.burton@intel.com>
Subject: Re: [PATCH 3/6] cve-update-db-native: clean up proxy handling
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
X-List-Received-Date: Mon, 18 Nov 2019 16:52:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/18/19 10:46 AM, Ross Burton wrote:
> urllib handles adding proxy handlers if the proxies are set in the environment,
> so call bb.utils.export_proxies() to do that and remove the manual setup.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../recipes-core/meta/cve-update-db-native.bb | 31 +++----------------
>  1 file changed, 5 insertions(+), 26 deletions(-)
> 
> diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
> index 08b18f064f0..db1d69a28e5 100644
> --- a/meta/recipes-core/meta/cve-update-db-native.bb
> +++ b/meta/recipes-core/meta/cve-update-db-native.bb
> @@ -21,10 +21,12 @@ python do_populate_cve_db() {
>      """
>      Update NVD database with json data feed
>      """
> -
> +    import bb.utils
>      import sqlite3, urllib, urllib.parse, shutil, gzip
>      from datetime import date
>  
> +    bb.utils.export_proxies(d)
> +
>      BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
>      YEAR_START = 2002

Two comments, I know unrelated to this specific commit, but I noticed them while
looking...

The current NVD data is now in the '1.1' format.  I was lead to believe the 1.0
feeds would be stopped at some point.

Second, if we're successful with some of the SRTool components, we should be
able to export the data into NVD format.  So in that case, it would be nice to
be able to point the cve-update components to an alternative datasource.  (I do
assume the data format is the same.)

--Mark

> @@ -40,16 +42,6 @@ python do_populate_cve_db() {
>      except OSError:
>          pass
>  
> -    proxy = d.getVar("https_proxy")
> -    if proxy:
> -        # instantiate an opener but do not install it as the global
> -        # opener unless if we're really sure it's applicable for all
> -        # urllib requests
> -        proxy_handler = urllib.request.ProxyHandler({'https': proxy})
> -        proxy_opener = urllib.request.build_opener(proxy_handler)
> -    else:
> -        proxy_opener = None
> -
>      cve_f = open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a')
>  
>      if not os.path.isdir(db_dir):
> @@ -67,15 +59,7 @@ python do_populate_cve_db() {
>          json_url = year_url + ".json.gz"
>  
>          # Retrieve meta last modified date
> -
> -        response = None
> -
> -        if proxy_opener:
> -            response = proxy_opener.open(meta_url)
> -        else:
> -            req = urllib.request.Request(meta_url)
> -            response = urllib.request.urlopen(req)
> -
> +        response = urllib.request.urlopen(meta_url)
>          if response:
>              for l in response.read().decode("utf-8").splitlines():
>                  key, value = l.split(":", 1)
> @@ -95,12 +79,7 @@ python do_populate_cve_db() {
>  
>              # Update db with current year json file
>              try:
> -                if proxy_opener:
> -                    response = proxy_opener.open(json_url)
> -                else:
> -                    req = urllib.request.Request(json_url)
> -                    response = urllib.request.urlopen(req)
> -
> +                response = urllib.request.urlopen(json_url)
>                  if response:
>                      update_db(c, gzip.decompress(response.read()).decode('utf-8'))
>                  c.execute("insert or replace into META values (?, ?)", [year, last_modified])
> 

