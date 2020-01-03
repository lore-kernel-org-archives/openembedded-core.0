Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 409F97F7A2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 00:49:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0030n9YH011141
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 2 Jan 2020 16:49:09 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 2 Jan 2020 16:49:09 -0800
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20191127164003.115980-1-alex.kanavin@gmail.com>
	<20191127164003.115980-6-alex.kanavin@gmail.com>
	<81f2806c-4107-2ce5-2c0f-4bdd28438fb1@windriver.com>
	<CANNYZj8CX3JB_XW=x-pXKejnHQ1GXFjgp01UtFUxnuC4xmmt2A@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <c39de046-dc12-23a9-e4ec-a77abf5b12d4@windriver.com>
Date: Fri, 3 Jan 2020 08:48:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CANNYZj8CX3JB_XW=x-pXKejnHQ1GXFjgp01UtFUxnuC4xmmt2A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/14] dummy-sdk-package.inc: do not include files into RREPLACES
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
X-List-Received-Date: Fri, 03 Jan 2020 00:49:10 -0000
Content-Type: multipart/alternative;
	boundary="------------B96FDD8EBBFD3CDCAA12CB6C"
Content-Language: en-US

--------------B96FDD8EBBFD3CDCAA12CB6C
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2020/1/3 上午2:06, Alexander Kanavin wrote:
> On Thu, 2 Jan 2020 at 11:18, Kang Kai <Kai.Kang@windriver.com 
> <mailto:Kai.Kang@windriver.com>> wrote:
>
>     On 2019/11/28 上午12:39, Alexander Kanavin wrote:
>     > rpm 4.15 no longer allows it, which makes sense.
>     >
>     > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>
>     Hi Alex,
>
>     I tried this patch with rpm 4.15 and it fails to run task
>     populate_sdk
>     when multilib is enabled and lib32-perl is installed.
>
>     IMAGE_INSTALL_append = " lib32-perl "
>
>
> I believe this is due to DUMMYPROVIDES_PACKAGES needing the same 
> multilib expansion as:
>
> DUMMYPROVIDES += "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in 
> d.getVar('DUMMYPROVIDES_PACKAGES').split()])}"
>
> So that RREPLACES has all the multilib variants included.
>
> However, there is also a different issue, that looks similar, but 
> actually pre-dates this patch, and rpm 4.15 update:
>
> if you do
> IMAGE_INSTALL_append = " perl "
>
> (with multilib enabled), a similar error will happen:
>
> Problem: package 
> target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target conflicts 
> with perl provided by perl-5.30.1-r0.core2_32
>   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target 
> conflicts with perl-module-strict provided by perl-5.30.1-r0.core2_32
>   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target 
> conflicts with perl-module-warnings provided by perl-5.30.1-r0.core2_32
>   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target 
> conflicts with perl-module-vars provided by perl-5.30.1-r0.core2_32
>   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target 
> conflicts with perl-module-config provided by perl-5.30.1-r0.core2_32
>   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target 
> conflicts with perl-module-warnings-register provided by 
> perl-5.30.1-r0.core2_32
>   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target 
> conflicts with /usr/bin/perl provided by perl-5.30.1-r0.core2_32
>   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target 
> conflicts with libperl.so.5 provided by perl-5.30.1-r0.core2_32
>   - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target 
> obsoletes perl provided by perl-5.30.1-r0.core2_32
>   - cannot install the best candidate for the job
>   - conflicting requests
>
> Inspecting 
> /home/alexander/development/poky/build-multilib/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/sdk/image/opt/poky/3.0/sysroots/core2-32-poky-linux/etc/dnf/vars/arch, 
> I see:
>
> core2_32:i686:i586:x86:sdk_provides_dummy_target:qemux86:x86_64
>
> Even though sdk_provides_dummy_target should be up-front, rather than 
> in the middle (so that it takes priority over other architectures).
>
> I could not figure out a good way to fix this, but I think this issue 
> should be addressed first, and then we can fix the lib32/64-perl issue.


Thanks for your detailed reply. I'll try to figure a way out.

Regards,
Kai

>
>
> Alex


-- 
Kai Kang


--------------B96FDD8EBBFD3CDCAA12CB6C
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2020/1/3 上午2:06, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj8CX3JB_XW=x-pXKejnHQ1GXFjgp01UtFUxnuC4xmmt2A@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">On Thu, 2 Jan 2020 at 11:18, Kang Kai &lt;<a
            href="mailto:Kai.Kang@windriver.com" moz-do-not-send="true">Kai.Kang@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">On 2019/11/28 上午12:39,
            Alexander Kanavin wrote:<br>
            &gt; rpm 4.15 no longer allows it, which makes sense.<br>
            &gt;<br>
            &gt; Signed-off-by: Alexander Kanavin &lt;<a
              href="mailto:alex.kanavin@gmail.com" target="_blank"
              moz-do-not-send="true">alex.kanavin@gmail.com</a>&gt;<br>
            <br>
            Hi Alex,<br>
            <br>
            I tried this patch with rpm 4.15 and it fails to run task
            populate_sdk <br>
            when multilib is enabled and lib32-perl is installed.<br>
            <br>
            IMAGE_INSTALL_append = " lib32-perl "<br>
          </blockquote>
          <div><br>
          </div>
          <div>I believe this is due to DUMMYPROVIDES_PACKAGES needing
            the same multilib expansion as:<br>
          </div>
          <div><br>
          </div>
          <div>DUMMYPROVIDES += <a class="moz-txt-link-rfc2396E" href="mailto:${@''.join([multilib_pkg_extend(d,pkg)forpkgind.getVar('DUMMYPROVIDES_PACKAGES').split()])}">"${@' '.join([multilib_pkg_extend(d,
            pkg) for pkg in
            d.getVar('DUMMYPROVIDES_PACKAGES').split()])}"</a></div>
          <div><br>
          </div>
          <div>So that RREPLACES has all the multilib variants included.<br>
          </div>
          <div><br>
          </div>
          <div>However, there is also a different issue, that looks
            similar, but actually pre-dates this patch, and rpm 4.15
            update:</div>
          <div><br>
          </div>
          <div>if you do <br>
          </div>
          <div>IMAGE_INSTALL_append = " perl "</div>
          <div><br>
          </div>
          <div>(with multilib enabled), a similar error will happen:</div>
          <div><br>
          </div>
          <div>Problem: package
            target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
            conflicts with perl provided by perl-5.30.1-r0.core2_32<br>
              - package
            target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
            conflicts with perl-module-strict provided by
            perl-5.30.1-r0.core2_32<br>
              - package
            target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
            conflicts with perl-module-warnings provided by
            perl-5.30.1-r0.core2_32<br>
              - package
            target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
            conflicts with perl-module-vars provided by
            perl-5.30.1-r0.core2_32<br>
              - package
            target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
            conflicts with perl-module-config provided by
            perl-5.30.1-r0.core2_32<br>
              - package
            target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
            conflicts with perl-module-warnings-register provided by
            perl-5.30.1-r0.core2_32<br>
              - package
            target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
            conflicts with /usr/bin/perl provided by
            perl-5.30.1-r0.core2_32<br>
              - package
            target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
            conflicts with libperl.so.5 provided by
            perl-5.30.1-r0.core2_32<br>
              - package
            target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
            obsoletes perl provided by perl-5.30.1-r0.core2_32<br>
              - cannot install the best candidate for the job<br>
              - conflicting requests</div>
          <div><br>
          </div>
          <div>Inspecting
/home/alexander/development/poky/build-multilib/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/sdk/image/opt/poky/3.0/sysroots/core2-32-poky-linux/etc/dnf/vars/arch,
            I see:</div>
          <div><br>
          </div>
          <div>core2_32:i686:i586:x86:sdk_provides_dummy_target:qemux86:x86_64</div>
          <div><br>
          </div>
          <div>Even though sdk_provides_dummy_target should be up-front,
            rather than in the middle (so that it takes priority over
            other architectures).</div>
          <div><br>
          </div>
          <div>I could not figure out a good way to fix this, but I
            think this issue should be addressed first, and then we can
            fix the lib32/64-perl issue.</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Thanks for your detailed reply. I'll try to figure a way out.<br>
    </p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type="cite"
cite="mid:CANNYZj8CX3JB_XW=x-pXKejnHQ1GXFjgp01UtFUxnuC4xmmt2A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div><br>
          </div>
          <div>Alex<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang</pre>
  </body>
</html>

--------------B96FDD8EBBFD3CDCAA12CB6C--
