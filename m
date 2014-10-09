Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 927176A9D4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 09:38:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s999cb8f017301
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Oct 2014 02:38:37 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 9 Oct 2014 02:38:37 -0700
Message-ID: <5436579B.8090502@windriver.com>
Date: Thu, 9 Oct 2014 17:38:35 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Martin Jansa
	<martin.jansa@gmail.com>
References: <1412644323-15125-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0La4eAU8KbST6B6vLyxSLNs+df7e__mCdEYy4ssA7mu6Mw@mail.gmail.com>
In-Reply-To: <CAJTo0La4eAU8KbST6B6vLyxSLNs+df7e__mCdEYy4ssA7mu6Mw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] nss-myhostname: blacklist because of conflict with systemd
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
X-List-Received-Date: Thu, 09 Oct 2014 09:38:46 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/07/2014 06:09 PM, Burton, Ross wrote:
> On 7 October 2014 02:12, Martin Jansa <martin.jansa@gmail.com> wrote:
>> +PNBLACKLIST[nss-myhostname] = "CONFLICT: systemd provides sysroots/qemux86-64/usr/lib/libnss_myhostname.so.2"
>
> How about we don't build throw a SkipPackage if nss-myhostname is
> building with the systemd DISTRO_FEATURE, as the conflict is because
> systemd has its own copy of nss-myhostname in the source tree?
>

Do you mean something like this ? I will send a patch for it and add Martin
in the CC list.

diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb 
b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
index 1237602..071e639 100644
--- a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
+++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
@@ -13,6 +13,12 @@ SRC_URI[sha256sum] = 
"2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67

  inherit autotools

+# The systemd has its own copy of nss-myhostname
+python () {
+       if bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
+               raise bb.parse.SkipPackage("'systemd' in DISTRO_FEATURES")
+}
+
  pkg_postinst_${PN} () {
         sed -e '/^hosts:/s/\s*\<myhostname\>//' \
                 -e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 
myhostname \3\4\5/' \

// Robert

> Ross
>

