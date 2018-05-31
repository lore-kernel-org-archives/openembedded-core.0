Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6061574D8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 00:24:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4V0NXch029007
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 May 2018 17:23:59 -0700
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 30 May 2018 17:23:23 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <1527654433-263632-1-git-send-email-changqing.li@windriver.com>
	<CANNYZj8kCFWOfoDdn+F8LsGtT7oG6TKapBEnzPTSL=K0sttbRg@mail.gmail.com>
	<5b7ff97e-01dd-527f-9ca2-942997b7e6e9@windriver.com>
	<7ae03f87-ddea-e8e4-20f6-3d0c2942ad61@windriver.com>
	<CANNYZj9WjP_FU_SbfZ7OpYqVOrm_HD73vNsY3r9WK4mWn7N4fQ@mail.gmail.com>
From: cli10 <changqing.li@windriver.com>
Message-ID: <68f21268-3859-27a4-751a-c67c1274fac0@windriver.com>
Date: Thu, 31 May 2018 08:23:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj9WjP_FU_SbfZ7OpYqVOrm_HD73vNsY3r9WK4mWn7N4fQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 31 May 2018 00:24:29 -0000
Content-Type: multipart/alternative;
	boundary="------------9EE35B30133A2DDD865FED9B"
Content-Language: en-US

--------------9EE35B30133A2DDD865FED9B
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 05/30/2018 06:12 PM, Alexander Kanavin wrote:
> 2018-05-30 12:37 GMT+03:00 cli10 <changqing.li@windriver.com>:
>> if in the future,  some recipe inherit allarch,  but use @qemu_run_binary
>> directly,  not call qemuwrapper,
>>
>> I think maybe still will met problem of get wrong base_libdir. so I think
>> maybe we should change qemu_wrapper_cmdline in
>>
>> qemu.bbclass, like this:
>>
>> -    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " +
>> rootfs_path\
>> +    return "PSEUDO_UNLOAD=1 " + "qemuwrapper" + " " + qemu_options + " -L "
>> + rootfs_path\
>>               + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "
> qemu_binary is determined like this:
>
>      qemu_binary = qemu_target_binary(data)
>      if qemu_binary == "qemu-allarch":
>          qemu_binary = "qemuwrapper"
>
> So it will fall back to qemuwrapper if the recipe inherits allarch.
>
> Besides, at this point it's a theoretical problem, right? We don't
> even have a suitable allarch recipe to play with and see where things
> work and where they don't, and whether the fallback to qemuwrapper
> works correctly. If such recipe appears, we can look at the issue
> again.
>
> Alex
>
   yes,  thanks for your comments.

    Changqing

-- 
BRs

Sandy(Li Changqing)
+861084778653


--------------9EE35B30133A2DDD865FED9B
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#99FF99">
    On 05/30/2018 06:12 PM, Alexander Kanavin wrote:<br>
    <blockquote type="cite"
cite="mid:CANNYZj9WjP_FU_SbfZ7OpYqVOrm_HD73vNsY3r9WK4mWn7N4fQ@mail.gmail.com">
      <pre wrap="">2018-05-30 12:37 GMT+03:00 cli10 <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>:
</pre>
      <blockquote type="cite">
        <pre wrap="">if in the future,  some recipe inherit allarch,  but use @qemu_run_binary
directly,  not call qemuwrapper,

I think maybe still will met problem of get wrong base_libdir. so I think
maybe we should change qemu_wrapper_cmdline in

qemu.bbclass, like this:

-    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " +
rootfs_path\
+    return "PSEUDO_UNLOAD=1 " + "qemuwrapper" + " " + qemu_options + " -L "
+ rootfs_path\
             + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "
</pre>
      </blockquote>
      <pre wrap="">
qemu_binary is determined like this:

    qemu_binary = qemu_target_binary(data)
    if qemu_binary == "qemu-allarch":
        qemu_binary = "qemuwrapper"

So it will fall back to qemuwrapper if the recipe inherits allarch.

Besides, at this point it's a theoretical problem, right? We don't
even have a suitable allarch recipe to play with and see where things
work and where they don't, and whether the fallback to qemuwrapper
works correctly. If such recipe appears, we can look at the issue
again.

Alex

</pre>
    </blockquote>
     <tt>  yes,  thanks for your comments.</tt><tt><br>
    </tt><tt>   </tt><tt><br>
    </tt><tt>   Changqing</tt><br>
    <pre class="moz-signature" cols="72">-- 
BRs

Sandy(Li Changqing)
+861084778653</pre>
  </body>
</html>

--------------9EE35B30133A2DDD865FED9B--
