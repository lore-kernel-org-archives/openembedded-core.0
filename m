Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19EEE7D28D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 03:21:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x683Karw001382
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 7 Jul 2019 20:20:46 -0700
Received: from localhost.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Sun, 7 Jul 2019 20:20:14 -0700
To: Pierre Le Magourou <lemagoup@gmail.com>
References: <20190627145917.1774-1-lemagoup@gmail.com>
	<6ab87120-92d4-7cbc-e88a-8e9261037901@windriver.com>
	<CAEz4NHr9ZEEGM+VjemOApAR0MepPjjXdumWOQb8iHOCcdBBuQg@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <1ee513e6-f233-605f-ced3-df612eec68bb@windriver.com>
Date: Mon, 8 Jul 2019 11:21:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAEz4NHr9ZEEGM+VjemOApAR0MepPjjXdumWOQb8iHOCcdBBuQg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 08 Jul 2019 03:21:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Pierre,

Did you try

$ bitbake universe --runall=fetch

Please? It still doesn't work on latest master branch.

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

// Robert


On 7/3/19 5:44 PM, Pierre Le Magourou wrote:
> Hello,
> 
>> This patch broke "bitbake universe --runall=fetch" totally:
>>
>> The line which caused the problem is:
>> addtask do_populate_cve_db before do_fetch
>>
>> Would you please fix it? Or I can help if needed.
>>
> 
> This seems related to the NVD website down problem. I sent a patch to
> manage inaccessible URLs. cve-update-db will not fail anymore if the
> NVD data feeds cannot be downloaded.
> 
> Pierre
> 

