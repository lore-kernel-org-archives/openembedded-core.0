Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3872061963
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 20:56:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r94Ku2GS004049
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 4 Oct 2013 13:56:02 -0700 (PDT)
Received: from [128.224.147.233] (128.224.147.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 4 Oct 2013 13:56:02 -0700
Message-ID: <524F2B61.10500@windriver.com>
Date: Fri, 4 Oct 2013 16:56:01 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <524E24AE.5060009@windriver.com> <1380883572.18603.591.camel@ted>
In-Reply-To: <1380883572.18603.591.camel@ted>
X-Originating-IP: [128.224.147.233]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: DISTRO_FEATURES and world builds.
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
X-List-Received-Date: Fri, 04 Oct 2013 20:56:04 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-10-04 06:46 AM, Richard Purdie wrote:
> On Thu, 2013-10-03 at 22:15 -0400, Randy MacLeod wrote:
>
>> If I drop x11 from the DF list things are even worse.
>>
>> I tried to sprinkle these recipes with:
>>      REQUIRED_DISTRO_FEATURES = "opengl"
>> but just as I thought, that didn't work either.
>
> Did you also inherit the class that implements that?

Oops, thanks.

I got this to at least start compiling but now
I think it should be a oe-core-1.6 feature. I've opened:

    https://bugzilla.yoctoproject.org/show_bug.cgi?id=5321

Details below.

// Randy


So that's a much cleaner change, eg:

meta/recipes-graphics/mesa/libglu_9.0.0.bb
...
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+REQUIRED_DISTRO_FEATURES = "opengl"

and adding additional features is easy too.

I stuck with this syntax and fixed all the recipes when
they failed at initial parse time. That left a few packagegroups
to be fixed and I ended up with:

  recipes-core/.../packagegroup-core-tools-testapps.bb |    2
  recipes-core/.../packagegroup-self-hosted.bb         |   14 ---
  recipes-extended/.../packagegroup-core-lsb.bb        |   41 ----------
  recipes-graphics/.../packagegroup-core-clutter.bb    |    3

The summary of this change was some simple changes:

meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
...
-inherit packagegroup
+inherit packagegroup distro_features_check
+REQUIRED_DISTRO_FEATURES = "opengl"

and some refactoring of packagegroups to ensure that the
graphical part of lsb and self-hosted could be easily disabled.


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

