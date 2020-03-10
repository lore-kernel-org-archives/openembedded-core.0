Return-Path: <ayoub.zaki@embexus.com>
Received: from mailrelay2-3.pub.mailoutpod1-cph3.one.com
	(mailrelay2-3.pub.mailoutpod1-cph3.one.com [46.30.212.11])
	by mail.openembedded.org (Postfix) with ESMTP id 399E86095A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 22:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=embexus.com; s=20191106;
	h=content-type:in-reply-to:mime-version:date:message-id:from:references:cc:to:
	subject:from; bh=i+zSBQktzdeGrVx+Wra0BiqQ45uQ6tif0gQIpgUpfpg=;
	b=VE7/B4EDBfFjSloQ3nJS/axA8nEW6EHNpAWpZseS5Xedap86sMBgWyDYcMVfcVKFv5nxOoPBbF0x8
	xe4Beq5x5gS3tL5FGD7u35Hq/DW5jj5L4+V4C2fOX/H2R6glsmB0/w/QLxk15Oi4NK4pxuQVkuHgrm
	gXMA6nEc+Mqb81V3ZMDYSXmdQgzyF4g0hjQF3ZKYgYlRutSLbc6QkO2/Ou/479GZq4FUqX9+Rrr2yf
	69AKu6wfsumytMOj+aPtSxNjyRzJBz/MUIAXO7fxPu90THtmGgIcFde+GFBePEZY73ZYo4vQWz+rLv
	r42TJ6W5O9stLcwdAXtBDuadVX/yJ4w==
X-HalOne-Cookie: 94e645944c1bd9fea2e1e9212d7e448bbef73e13
X-HalOne-ID: 279b7456-6322-11ea-9550-d0431ea8a290
Received: from [192.168.178.22] (x4db4211c.dyn.telefonica.de [77.180.33.28])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 279b7456-6322-11ea-9550-d0431ea8a290;
	Tue, 10 Mar 2020 22:54:53 +0000 (UTC)
To: Bartosz Golaszewski <brgl@bgdev.pl>
References: <CAMRc=Mf_Ld80=Egf3jPBGYoGGZScSG3JHKL7cVArLihJSC8P0g@mail.gmail.com>
	<a571c00e-5c90-462b-2402-d82b5f0b8cf9@embexus.com>
	<CAMRc=MdizEv6uB_Z+zyCYjtZuoYVWK5LP9jBAGBazkWoCXr4EA@mail.gmail.com>
From: Ayoub Zaki <ayoub.zaki@embexus.com>
Message-ID: <e17ac6c1-2be8-f383-ee2d-b357322db84d@embexus.com>
Date: Tue, 10 Mar 2020 23:54:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAMRc=MdizEv6uB_Z+zyCYjtZuoYVWK5LP9jBAGBazkWoCXr4EA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Solving a circular dependency issue between the main image and initramfs
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
X-List-Received-Date: Tue, 10 Mar 2020 22:54:54 -0000
Content-Type: multipart/alternative;
	boundary="------------CCA3816DDF5C971DF31F4D5F"
Content-Language: en-US

--------------CCA3816DDF5C971DF31F4D5F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10.03.20 23:02, Bartosz Golaszewski wrote:
> wt., 10 mar 2020 o 22:33 Ayoub Zaki <ayoub.zaki@embexus.com> napisał(a):
>>> Do I implement do_install in image.bbclass so that initramfs can
>>> depend on core-image-full-cmdline:do_populate_sysroot and have the
>>> artifacts installed locally? But this would mean that the initramfs
>>> recipe deploys the main image artifact. Should we deploy the images
>>> earlier (before do_image_complete) for the initramfs recipe to fetch
>>> from DEPLOY_DIR_IMAGE? Any other ideas?
>>
>> I think that best thing is to implement the dm-verity stuffs as a wic
>> plugin, check this example:
>>
>>
>> https://github.com/intel/intel-iot-refkit/blob/master/meta-refkit-core/scripts/lib/wic/plugins/source/dm-verity.py
>>
> This doesn't look like a correct solution. For starters: not every
> platform uses wic. The platform I'm aiming this at uses fastboot and
> requires separate images for each partition.


My proposition was refering to your example :


https://github.com/brgl/meta-security/commit/83c8e8fba6988249c9d351aa2ad6e02a71b010df#diff-33f7c29b373860ec45379a5f2dc42a75


your are trying to include the dm-verity conversion output to your wic 
wks using the following:


part / --source rawcopy --ondisk mmcblk 
--sourceparams="file=${IMGDEPLOYDIR}/${DM_VERITY_IMAGE}-${MACHINE}.${DM_VERITY_TYPE}"


In this case you will definitely stuck in a circular dependency unless 
using a Wic plugin.

>
> This plugin also seems to be unnecessarily complicated with additional
> signature for the verity hash tree. This is not needed as long as the
> root hash comes from a secure place - which it does in my case: the
> fitImage containing the initramfs is signed and the key is appended to
> u-boot's DTB. When do_image_wic starts, u-boot and initramfs assembly
> are long completed - another reason for not using a wic plugin.


I was referring to the plugin not the implementation which does not work 
anyway...


Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg


Mobile   : +4917662901545
Email    : ayoub.zaki@embexus.com
Homepage : https://embexus.com
VAT No.  : DE313902634


--------------CCA3816DDF5C971DF31F4D5F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10.03.20 23:02, Bartosz Golaszewski
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMRc=MdizEv6uB_Z+zyCYjtZuoYVWK5LP9jBAGBazkWoCXr4EA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">wt., 10 mar 2020 o 22:33 Ayoub Zaki <a class="moz-txt-link-rfc2396E" href="mailto:ayoub.zaki@embexus.com">&lt;ayoub.zaki@embexus.com&gt;</a> napisał(a):
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Do I implement do_install in image.bbclass so that initramfs can
depend on core-image-full-cmdline:do_populate_sysroot and have the
artifacts installed locally? But this would mean that the initramfs
recipe deploys the main image artifact. Should we deploy the images
earlier (before do_image_complete) for the initramfs recipe to fetch
from DEPLOY_DIR_IMAGE? Any other ideas?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">

I think that best thing is to implement the dm-verity stuffs as a wic
plugin, check this example:


<a class="moz-txt-link-freetext" href="https://github.com/intel/intel-iot-refkit/blob/master/meta-refkit-core/scripts/lib/wic/plugins/source/dm-verity.py">https://github.com/intel/intel-iot-refkit/blob/master/meta-refkit-core/scripts/lib/wic/plugins/source/dm-verity.py</a>

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This doesn't look like a correct solution. For starters: not every
platform uses wic. The platform I'm aiming this at uses fastboot and
requires separate images for each partition.</pre>
    </blockquote>
    <p><br>
    </p>
    My proposition was refering to your example :<br>
    <br>
    <br>
<a class="moz-txt-link-freetext" href="https://github.com/brgl/meta-security/commit/83c8e8fba6988249c9d351aa2ad6e02a71b010df#diff-33f7c29b373860ec45379a5f2dc42a75">https://github.com/brgl/meta-security/commit/83c8e8fba6988249c9d351aa2ad6e02a71b010df#diff-33f7c29b373860ec45379a5f2dc42a75</a><br>
    <br>
    <br>
    your are trying to include the dm-verity conversion output to your
    wic wks using the following:<br>
    <br>
    <br>
    part / --source rawcopy --ondisk mmcblk
--sourceparams="file=${IMGDEPLOYDIR}/${DM_VERITY_IMAGE}-${MACHINE}.${DM_VERITY_TYPE}"<br>
    <br>
    <br>
    In this case you will definitely stuck in a circular dependency
    unless using a Wic plugin.<br>
    <p><span class="blob-code-inner blob-code-marker" data-code-marker="+" style="box-sizing: border-box; overflow: visible; font-family: SFMono-Regular, Consolas, &quot;Liberation Mono&quot;, Menlo, monospace; font-size: 12px; color: rgb(36, 41, 46); overflow-wrap: normal; white-space: pre;">
</span></p>
    <blockquote type="cite"
cite="mid:CAMRc=MdizEv6uB_Z+zyCYjtZuoYVWK5LP9jBAGBazkWoCXr4EA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

This plugin also seems to be unnecessarily complicated with additional
signature for the verity hash tree. This is not needed as long as the
root hash comes from a secure place - which it does in my case: the
fitImage containing the initramfs is signed and the key is appended to
u-boot's DTB. When do_image_wic starts, u-boot and initramfs assembly
are long completed - another reason for not using a wic plugin.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>I was referring to the plugin not the implementation which does
      not work anyway...<br>
    </p>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg


Mobile   : +4917662901545
Email    : <a class="moz-txt-link-abbreviated" href="mailto:ayoub.zaki@embexus.com">ayoub.zaki@embexus.com</a>
Homepage : <a class="moz-txt-link-freetext" href="https://embexus.com">https://embexus.com</a>
VAT No.  : DE313902634</pre>
  </body>
</html>

--------------CCA3816DDF5C971DF31F4D5F--
