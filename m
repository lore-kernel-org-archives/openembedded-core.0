Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC4860049
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 09:37:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4U9bSYI005142
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 May 2018 02:37:28 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 30 May 2018 02:37:28 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <1527654433-263632-1-git-send-email-changqing.li@windriver.com>
	<CANNYZj8kCFWOfoDdn+F8LsGtT7oG6TKapBEnzPTSL=K0sttbRg@mail.gmail.com>
	<5b7ff97e-01dd-527f-9ca2-942997b7e6e9@windriver.com>
From: cli10 <changqing.li@windriver.com>
Message-ID: <7ae03f87-ddea-e8e4-20f6-3d0c2942ad61@windriver.com>
Date: Wed, 30 May 2018 17:37:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <5b7ff97e-01dd-527f-9ca2-942997b7e6e9@windriver.com>
X-Originating-IP: [128.224.162.228]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemuwrapper-cross: fix postinst failed warning
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
X-List-Received-Date: Wed, 30 May 2018 09:37:29 -0000
Content-Type: multipart/alternative;
	boundary="------------866A7D772B9C0BC927437E5C"
Content-Language: en-US

--------------866A7D772B9C0BC927437E5C
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Alex

I have test with your patch,  test passed,  all warnings are fixed:-).

But I have a  problem about this, could you help to give some comments? 
Thanks.


if in the future,  some recipe inherit allarch,  but use 
@qemu_run_binary directly,  not call qemuwrapper,

I think maybe still will met problem of get wrong base_libdir. so I 
think maybe we should change qemu_wrapper_cmdline in

qemu.bbclass, like this:

-    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
+    return "PSEUDO_UNLOAD=1 " + "qemuwrapper" + " " + qemu_options + " -L " + rootfs_path\
              + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "

but some recipe or class like: gtk-doc.bbclass and 
gobject-introspection_1.56.1.bb,  they use

"@qemu_wrapper_cmdline" directly,  if we change qemu_wrapper_cmdline 
like above way,  we will met

another problem that  qemuwrapper have set LD_LIBRARY_PATH,  if user 
need to set extra lib path,  user

setting will override setting in qemuwrapper,  and also this is why in 
my patch I add a python script qemuwrapperhelper to this.



On 05/30/2018 03:05 PM, cli10 wrote:
> OK, I will test with your patch:-)
>
> On 05/30/2018 02:41 PM, Alexander Kanavin wrote:
>> 2018-05-30 7:27 GMT+03:00<changqing.li@windriver.com>:
>>> From: Changqing Li<changqing.li@windriver.com>
>>>
>>> 1. some binary like udev-hwdb/pixbufcache/gio-module-cache/fontcache
>>> uses qemu usermode by default,  but some architecture such as Intel
>>> skylake does not support qemu usermode, this can lead to a build warning as below:
>>> 2. font is not arch related, but receipe like liberation-fonts inherit fontcache,
>>> fontcache called update_font_cache, update_font_cache use qemuwrapper,
>>> qemuwrapper is arch related, so update_font_cache will core dumped as below:
>> I need to apologize. I went ahead and fixed all of these issues myself
>> over the weekend, and improved a few other things in how postinsts
>> (and postinst intercepts) are handled. Should've told you immediately.
>> The seven patches have been sent, so if you can test and confirm that
>> they indeed fix these issues, I'd appreciate.
>> http://lists.openembedded.org/pipermail/openembedded-core/2018-May/151196.html
>>
>> Alex
>>
>
> -- 
> BRs
>
> Sandy(Li Changqing)
> +861084778653
>
>

-- 
BRs

Sandy(Li Changqing)
+861084778653


--------------866A7D772B9C0BC927437E5C
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#99FF99">
    <p>Hi, Alex</p>
    <p>I have test with your patch,  test passed,  all warnings are
      fixed<span class="moz-smiley-s1"><span>:-)</span></span>.<br>
    </p>
    <p>But I have a  problem about this, could you help to give some
      comments? Thanks. </p>
    <p><br>
    </p>
    <p>if in the future,  some recipe inherit allarch,  but use
      @qemu_run_binary directly,  not call qemuwrapper,</p>
    <p>I think maybe still will met problem of get wrong base_libdir. so
      I think maybe we should change qemu_wrapper_cmdline in</p>
    <p>qemu.bbclass, like this:</p>
    <pre wrap="">-    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
+    return "PSEUDO_UNLOAD=1 " + "qemuwrapper" + " " + qemu_options + " -L " + rootfs_path\
             + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "

</pre>
    <p>but some recipe or class like: gtk-doc.bbclass and
      gobject-introspection_1.56.1.bb,  they use <br>
    </p>
    <p>"@qemu_wrapper_cmdline" directly,  if we change
      qemu_wrapper_cmdline like above way,  we will met <br>
    </p>
    <p>another problem that  qemuwrapper have set LD_LIBRARY_PATH,  if
      user need to set extra lib path,  user</p>
    <p>setting will override setting in qemuwrapper,  and also this is
      why in my patch I add a python script qemuwrapperhelper to this. <br>
    </p>
    <br>
    <br>
    <div class="moz-cite-prefix">On 05/30/2018 03:05 PM, cli10 wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:5b7ff97e-01dd-527f-9ca2-942997b7e6e9@windriver.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      OK, I will test with your patch<span class="moz-smiley-s1"><span>:-)</span></span><br>
      <br>
      <div class="moz-cite-prefix">On 05/30/2018 02:41 PM, Alexander
        Kanavin wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:CANNYZj8kCFWOfoDdn+F8LsGtT7oG6TKapBEnzPTSL=K0sttbRg@mail.gmail.com">
        <pre wrap="">2018-05-30 7:27 GMT+03:00  <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>:
</pre>
        <blockquote type="cite">
          <pre wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>

1. some binary like udev-hwdb/pixbufcache/gio-module-cache/fontcache
uses qemu usermode by default,  but some architecture such as Intel
skylake does not support qemu usermode, this can lead to a build warning as below:
2. font is not arch related, but receipe like liberation-fonts inherit fontcache,
fontcache called update_font_cache, update_font_cache use qemuwrapper,
qemuwrapper is arch related, so update_font_cache will core dumped as below:
</pre>
        </blockquote>
        <pre wrap="">I need to apologize. I went ahead and fixed all of these issues myself
over the weekend, and improved a few other things in how postinsts
(and postinst intercepts) are handled. Should've told you immediately.
The seven patches have been sent, so if you can test and confirm that
they indeed fix these issues, I'd appreciate.
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/pipermail/openembedded-core/2018-May/151196.html" moz-do-not-send="true">http://lists.openembedded.org/pipermail/openembedded-core/2018-May/151196.html</a>

Alex

</pre>
      </blockquote>
      <br>
      <pre class="moz-signature" cols="72">-- 
BRs

Sandy(Li Changqing)
+861084778653</pre>
      <!--'"--><br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
BRs

Sandy(Li Changqing)
+861084778653</pre>
  </body>
</html>

--------------866A7D772B9C0BC927437E5C--
