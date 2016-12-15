Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 54840772E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 20:15:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 15 Dec 2016 12:15:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,353,1477983600"; d="scan'208,217";a="18651856"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.128.142])
	([10.219.128.142])
	by orsmga002.jf.intel.com with ESMTP; 15 Dec 2016 12:15:20 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<2ecee254e60279af29f86073837fe8bd25998766.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LY6xCfxisFKFmeMuHEVayv28W7-1FiLDaUwT96YmTDWdg@mail.gmail.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <53923a5b-8251-a78c-17a7-2c8ce86b2070@linux.intel.com>
Date: Thu, 15 Dec 2016 14:21:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY6xCfxisFKFmeMuHEVayv28W7-1FiLDaUwT96YmTDWdg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 11/13] selftest: sstatetests: skip methods in case of poky-tiny or opengl is missing
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
X-List-Received-Date: Thu, 15 Dec 2016 20:15:20 -0000
Content-Type: multipart/alternative;
	boundary="------------A612E309EDB5918FA2CF3C99"

--------------A612E309EDB5918FA2CF3C99
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/13/2016 09:25 AM, Burton, Ross wrote:
> On 24 November 2016 at 20:58, 
> <leonardo.sandoval.gonzalez@linux.intel.com 
> <mailto:leonardo.sandoval.gonzalez@linux.intel.com>> wrote:
>
>     diff --git a/meta/lib/oeqa/selftest/sstatetests.py
>     b/meta/lib/oeqa/selftest/sstatetests.py
>     index 6642539..8ea3932 100644
>     --- a/meta/lib/oeqa/selftest/sstatetests.py
>     +++ b/meta/lib/oeqa/selftest/sstatetests.py
>     @@ -42,20 +42,36 @@ class SStateTests(SStateBase):
>          @testcase(975)
>          def test_sstate_creation_distro_specific_pass(self):
>              targetarch = get_bb_var('TUNE_ARCH')
>     -        self.run_test_sstate_creation(['binutils-cross-'+
>     targetarch, 'binutils-native'], distro_specific=True,
>     distro_nonspecific=False, temp_sstate_location=True)
>     +        # Execute the test in all distros expect poky-tiny where
>     glibc-initial is not provided
>     +        targets = ['binutils-cross-'+ targetarch, 'binutils-native']
>     +        if self.distro == 'poky-tiny':
>     +            self.skipTest('Distro %s does not support building
>     the following targets %s' % (self.distro, ','.join(targets)))
>     +        self.run_test_sstate_creation(targets,
>     distro_specific=True, distro_nonspecific=False,
>     temp_sstate_location=True)
>
>
> Sounds like it would be easier to just remove glibc-initial from that 
> list, and either remove it entirely or replace it with a virtual name 
> that both glibc and musl provide.
Ok
>
>     @@ -228,6 +255,8 @@ class SStateTests(SStateBase):
>              build machines and running a builds, override the
>     variables calling uname()
>              manually and check using bitbake -S.
>              """
>     +        if self.distro == 'poky-tiny':
>     +            self.skipTest('core-image-sato not buildable for
>     poky-tiny')
>
>              topdir = get_bb_var('TOPDIR')
>              targetvendor = get_bb_var('TARGET_VENDOR')
>
>
> For all of these tests that just do bitbake -S core-image-sato, if 
> world works then that is more flexible and more comprehensive.
>

Agree. Sending v3 soon.


> Ross


--------------A612E309EDB5918FA2CF3C99
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 12/13/2016 09:25 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LY6xCfxisFKFmeMuHEVayv28W7-1FiLDaUwT96YmTDWdg@mail.gmail.com"
      type="cite">
      <div dir="ltr">On 24 November 2016 at 20:58, <span dir="ltr">&lt;<a
            moz-do-not-send="true"
            href="mailto:leonardo.sandoval.gonzalez@linux.intel.com"
            target="_blank">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">diff
              --git a/meta/lib/oeqa/selftest/<wbr>sstatetests.py
              b/meta/lib/oeqa/selftest/<wbr>sstatetests.py<br>
              index 6642539..8ea3932 100644<br>
              --- a/meta/lib/oeqa/selftest/<wbr>sstatetests.py<br>
              +++ b/meta/lib/oeqa/selftest/<wbr>sstatetests.py<br>
              @@ -42,20 +42,36 @@ class SStateTests(SStateBase):<br>
                   @testcase(975)<br>
                   def test_sstate_creation_distro_<wbr>specific_pass(self):<br>
                       targetarch = get_bb_var('TUNE_ARCH')<br>
              -        self.run_test_sstate_creation(<wbr>['binutils-cross-'+
              targetarch, 'binutils-native'], distro_specific=True,
              distro_nonspecific=False, temp_sstate_location=True)<br>
              +        # Execute the test in all distros expect
              poky-tiny where glibc-initial is not provided<br>
              +        targets = ['binutils-cross-'+ targetarch,
              'binutils-native']<br>
              +        if self.distro == 'poky-tiny':<br>
              +            self.skipTest('Distro %s does not support
              building the following targets %s' % (self.distro,
              ','.join(targets)))<br>
              +        self.run_test_sstate_creation(<wbr>targets,
              distro_specific=True, distro_nonspecific=False,
              temp_sstate_location=True)<br>
            </blockquote>
            <div><br>
            </div>
            <div>Sounds like it would be easier to just remove
              glibc-initial from that list, and either remove it
              entirely or replace it with a virtual name that both glibc
              and musl provide.</div>
          </div>
        </div>
      </div>
    </blockquote>
    Ok<br>
    <blockquote
cite="mid:CAJTo0LY6xCfxisFKFmeMuHEVayv28W7-1FiLDaUwT96YmTDWdg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div> <br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">@@
              -228,6 +255,8 @@ class SStateTests(SStateBase):<br>
                       build machines and running a builds, override the
              variables calling uname()<br>
                       manually and check using bitbake -S.<br>
                       """<br>
              +        if self.distro == 'poky-tiny':<br>
              +            self.skipTest('core-image-sato not buildable
              for poky-tiny')<br>
              <br>
                       topdir = get_bb_var('TOPDIR')<br>
                       targetvendor = get_bb_var('TARGET_VENDOR')<br>
            </blockquote>
            <div><br>
            </div>
            <div>For all of these tests that just do bitbake -S
              core-image-sato, if world works then that is more flexible
              and more comprehensive.</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Agree. Sending v3 soon.<br>
    <br>
    <br>
    <blockquote
cite="mid:CAJTo0LY6xCfxisFKFmeMuHEVayv28W7-1FiLDaUwT96YmTDWdg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div>Ross</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------A612E309EDB5918FA2CF3C99--
