Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5EA9D71984
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 07:17:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0A7HZAl026367
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Jan 2019 23:17:35 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.163.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 9 Jan 2019 23:17:34 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Mark Hatle
	<mark.hatle@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <8a7ab09f-a64a-71ee-f123-01b988575f0e@windriver.com>
Date: Thu, 10 Jan 2019 15:22:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Suggest removing classes/siteconfig.bbclass
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
X-List-Received-Date: Thu, 10 Jan 2019 07:17:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

I reimplemented glibc's site config and did a lot of tests recently, finally,
I found that it isn't as useful as I had thought, so I'm leaning to remove
classes/siteconfig.bbclass.

* Here are the test results of with/without glibc's siteconfig:
$ bitbake recipe -cconfigure && bitbake recipe -ccleansstate && time bitbake 
recipe -cconfigure
- gettext:
     without: 2m38.382s
     with:    2m33.099s

- coreutils:
     without: 1m19.967s
     with:    1m13.574s

- bison:
     without: 0m56.203s
     with:    0m50.134s

These 3 recipes' do_configure are very time consuming, we can see that it saves
about 6s for bison/coreutils/gettext's do_configure, but they need depend on
glibc's site config recipe (glibc-site.bb), while glibc-site requires about 30s
to build, so if we count glibc-site's 30s, it seems not worth. And I also tested
again and again on core-image-minimal and core-image-sato with/without glibc's
siteconfig, there is nearly no difference, about 30s in 30m (1.6%)'s
differences, this maybe because of host rather than siteconfig. So I think that
we can remove classes/siteconfig.bbclass since it is not as useful as expected.

I've also tested remove siteconfig.bbclass (zlib and ncurses use it), there is
no difference when "time bitbake core-image-minimal".

The new implementation for glibc's site config is:
- Add a recipe called glibc-site_2.28.bb, find out the top 100 used functions
   and headers, and add them to site_config/funcs and site_config/headers. Please
   see patches' commit message on how to find out the top 100.

- Make target/nativesdk recipes depend on glibc-site when inherit autotools.bbclass

Here are the 2 patches:
   git://git.openembedded.org/openembedded-core-contrib rbt/glibc-site
   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/glibc-site


Please feel free to give your comments, and I will remove it if no objections.

-- 
Thanks

Robert

