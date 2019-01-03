Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CF0D60290
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 02:39:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x032dJiv021007
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Jan 2019 18:39:19 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 2 Jan 2019 18:39:12 -0800
To: oe-core <openembedded-core@lists.openembedded.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <8c406411-18c3-b5ea-7ff5-38a9e3a30e9e@windriver.com>
Date: Thu, 3 Jan 2019 10:44:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
Subject: Efficient ways to delete a build directory
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
X-List-Received-Date: Thu, 03 Jan 2019 02:39:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


We have the following 3 ways to delete a build directory:
* rm -fr build
* find -delete build
* rsync -a --delete emtpy_dir build

I've heard that rsync is the fastest way for removing millions of files,
so I did a test on removing the build dir:

* Host info:
   $ cat /etc/issue
   Ubuntu 14.04.4 LTS \n \l

   $ rm --version
   rm (GNU coreutils) 8.21

   $ find --version
   find (GNU findutils) 4.4.2

   $ rsync --version
   rsync  version 3.1.0  protocol version 31

* Do a build
   $ . oe-init-build-env build
   $ bitbake core-image-minimal

* Size:
   $ du -sh build
   22G

* Files amount:
   $ find build -type f | pv -l  >/dev/null
   2.61M

   2.61 millions files

* Make 3 copies:
   $ cp -r build build_copy_1
   $ cp -r build build_copy_2
   $ cp -r build build_copy_3

* Remove them:
   $ time rm -fr build_copy_1/
   real    3m26.249s
   user    0m4.612s
   sys     1m1.704s

   $ time find build_copy_2/ -delete
   real    3m6.771s
   user    0m4.236s
   sys     0m59.592s

   $ time rsync -a --delete empty/ build_copy_3/
   real    5m7.115s
   user    0m8.612s
   sys     1m13.928s

We can see that find -delete is the fastest way, rsync is the slowest one,
and rm is close to find. Maybe it is because find and rsync are improved in
nowadays, so they are faster than rsync.

-- 
Thanks

Robert

