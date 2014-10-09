Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9E92371758
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 13:26:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s99DPtQG003612
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 Oct 2014 06:25:55 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 9 Oct 2014 06:25:54 -0700
Message-ID: <54368CE0.9060601@windriver.com>
Date: Thu, 9 Oct 2014 21:25:52 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1412847857.git.liezhi.yang@windriver.com>
	<406803c854b29b938a72d217c889ed63e1d7fe92.1412847857.git.liezhi.yang@windriver.com>
	<CAJTo0LZ+6dC=FZFYO17YyCKNLr8=-wGFOGTmL+tE9teDKzhJ=g@mail.gmail.com>
In-Reply-To: <CAJTo0LZ+6dC=FZFYO17YyCKNLr8=-wGFOGTmL+tE9teDKzhJ=g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] nss-myhostname: skip it when systemd
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
X-List-Received-Date: Thu, 09 Oct 2014 13:26:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/09/2014 08:49 PM, Burton, Ross wrote:
> On 9 October 2014 10:45, Robert Yang <liezhi.yang@windriver.com> wrote:
>> +python () {
>> +       if bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
>> +               raise bb.parse.SkipPackage("'systemd' in DISTRO_FEATURES")
>> +}
>
> Please use distro_features_check for conciseness.

Sounds good, updated:
git://git.openembedded.org/openembedded-core-contrib rbt/nss

diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb 
b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
index 1237602..bbce9e9 100644
--- a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
+++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
@@ -11,7 +11,10 @@ SRC_URI = 
"http://0pointer.de/lennart/projects/nss-myhostname/nss-myhostname-${P
  SRC_URI[md5sum] = "d4ab9ac36c053ab8fb836db1cbd4a48f"
  SRC_URI[sha256sum] = 
"2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67e7caf2"

-inherit autotools
+inherit autotools distro_features_check
+
+# The systemd has its own copy of nss-myhostname
+CONFLICT_DISTRO_FEATURES = "systemd"

  pkg_postinst_${PN} () {
         sed -e '/^hosts:/s/\s*\<myhostname\>//' \


>
> Ross
>
>

