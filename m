Return-Path: <charles.wh.chan@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 05947770CD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 19:40:14 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id e185so72078119vkb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2016 12:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wP1y7TbtUkUmDF0L4UqFbGIo53GungvIn6DNRGVIqao=;
	b=rjyZX2AaYSzjLT+JUKCdpLbtflkB2kimNhhV8xkcNpbJWxFK2zvVkDoiJUg8vu7VsB
	NuJjhqeTlcu7l1i1yWHMSg/zEwL6p8pxcHxVHS6G0tXSfFruH/4vjnK4w7cYVhbWkWLf
	arKq7KGNJnslpMsSPzVNoy4N3+2FFD12oUAeIUXgh30H4DdDAbG57SdX8jt3erq7KJSD
	AvHP2sTfyzIYjbRneabMCUuiDF8nSdNCI/e7plEEVFautjDoE0/Q/+h4GMigSXuuv6Zp
	l/eovES4NrIAnlPBK5ryF8vopSuxDiZhZLwHUVBqMfdGOSHX7e9S51PI66c50YqPrG+q
	ZNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wP1y7TbtUkUmDF0L4UqFbGIo53GungvIn6DNRGVIqao=;
	b=lNqihc4kFE8qn3c3pGYGt4YO3bHheQ4SR4kulw4w0OKwFBMWxqdqZ+zL3oXn+piJq7
	3JdZbKYBOqmPMex/b5/+B65W0K42l1HAng94jnefUxOIwKkQi0LnxvyGhQ2bd/aV64pw
	Oh80+GsmW8ZF5iKmZ+0vdKl1HV1q/5N0LE/GyEyrnVymLOE1HG0HUlDF+vXBsfQQnOHD
	EcSb6fpme8uEyaNKFM/W7F1gyU258lyDUFUKPYAO0lHBB3cW7l/mIvBBc/9H2Z4zrqxh
	8yq+eT7gBOT9Iflt7mruCkMeIeuMopdFf0S7WNbyywNGpjRZeRy4TYHkX2YC/fUlYDT9
	YpQA==
X-Gm-Message-State: AD7BkJKW0S2ZTNZeRrHG4e5R/JW/0fCYI8f2mxUS3rSU4iqgLci/tHxxvlaspta1jLHEjICh35jkyNbSjWgb2g==
X-Received: by 10.176.1.173 with SMTP id 42mr16042083ual.76.1459971614508;
	Wed, 06 Apr 2016 12:40:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.33.213 with HTTP; Wed, 6 Apr 2016 12:39:35 -0700 (PDT)
In-Reply-To: <57049FBF.1010504@windriver.com>
References: <CAEDY82g1SD-4C1BVH6X2OJFkG9-KiqKSkRZzTKMUwu38dphvuw@mail.gmail.com>
	<57049FBF.1010504@windriver.com>
From: Charles Chan <charles.wh.chan@gmail.com>
Date: Wed, 6 Apr 2016 12:39:35 -0700
Message-ID: <CAEDY82hDvy0Fe3HWE-1WPDQEst7TbOrvoU_KjrGaLXbXZ3Gofw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Security question: base-files_3.0.14.bb and ${ROOT_HOME} directory permission
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
X-List-Received-Date: Wed, 06 Apr 2016 19:40:17 -0000
Content-Type: multipart/alternative; boundary=001a113ee4ca770f8d052fd621bd

--001a113ee4ca770f8d052fd621bd
Content-Type: text/plain; charset=UTF-8

Hi Robert,

Thanks for the patch. I tested it and it worked ... partially.

Taking an existing image and then using `opkg install base-files.ipk` will
correctly set the permission to 0700.

However, when I rebuild the full image rootfs, /home/root still ends up
with the wrong permission. I suspect another recipe is modifying the
permission. Is there a way (ie. bitbake command) to find out which recipe
is causing the change?

Thanks again,
Charles


On Tue, Apr 5, 2016 at 10:33 PM, Robert Yang <liezhi.yang@windriver.com>
wrote:

>
> I think that it should be a bug, would you please try this patch?
>
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb
> b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index d391707..2082ed4 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -95,6 +95,7 @@ do_install () {
>         for d in ${dirs755}; do
>                 install -m 0755 -d ${D}$d
>         done
> +       chmod 0700 ${D}${ROOT_HOME}
>         for d in ${dirs1777}; do
>                 install -m 1777 -d ${D}$d
>         done
>
> // Robert
>
> On 04/06/2016 01:03 PM, Charles Chan wrote:
>
>> (This is my first post to OE list, hopefully I am posting to the right
>> mailing
>> list.)
>>
>> Background: During the process of trying to configure SSH keys for root
>> user
>> login via dropbear, we realized the permission for /home/root directory
>> is set
>> too loose for group and other members [1]. As a result, dropbears fails
>> when we
>> try to put the key under /home/root/.ssh
>>
>> ---------
>>
>> In the image, /home/root directory is set to 0755:
>>
>>     $ stat /home/root
>>        File: /home/root
>>        Size: 4096            Blocks: 8          IO Block: 4096   directory
>>     Device: b302h/45826d    Inode: 13268       Links: 4
>>     Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/
>> root)
>>     Access: 2016-04-05 22:21:13.000000000
>>     Modify: 2016-04-05 22:08:57.000000000
>>     Change: 2016-04-05 22:08:57.000000000
>>
>>
>> After some debugging, we believe the permission (0755) is initialized in
>> base-files_3.0.14.bb <http://base-files_3.0.14.bb> (in line 35) [2].
>>
>> A few questions:
>> 1. I tried looking at the git log for the history, but wasn't able to
>> find any
>> background on why the permission was set this way. eg. on a desktop Linux
>> (Ubuntu), /root is set to 0700:
>>
>>     $ sudo stat /root
>>        File: `/root'
>>        Size: 4096 Blocks: 8          IO Block: 4096   directory
>>     Device: 801h/2049dInode: 1441793     Links: 3
>>     Access: (0700/drwx------)  Uid: (    0/    root)   Gid: (    0/
>> root)
>>     Access: 2016-04-05 21:29:17.389725228 -0700
>>     Modify: 2016-03-22 17:11:54.912479000 -0700
>>     Change: 2016-03-22 17:11:54.912479000 -0700
>>       Birth: -
>>
>>
>> 2. If we would like to override the directory permission for /home/root
>> in our
>> image, what is the best way to do it? I am not an expert with bitbake,
>> should I
>> be patching the base-files_3.0.14.bb <http://base-files_3.0.14.bb>? using
>> *_append? or I should be looking at some other recipe altogether?
>>
>> Sorry for the long email. Thanks in advance.
>> Charles
>>
>> [1]
>> https://wiki.openwrt.org/doc/howto/dropbear.public-key.auth#troubleshooting
>>
>> [2]
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded-core/tree/meta/recipes-core/base-files/base-files_3.0.14.bb?h=master#n35
>>
>>
>>

--001a113ee4ca770f8d052fd621bd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Robert,=C2=A0<div><br></div><div>Thanks for the patch. =
I tested it and it worked ... partially.</div><div><br></div><div>Taking an=
 existing image and then using `opkg install base-files.ipk` will correctly=
 set the permission to 0700.</div><div><br></div><div>However, when I rebui=
ld the full image rootfs, /home/root still ends up with the wrong permissio=
n. I suspect another recipe is modifying the permission. Is there a way (ie=
. bitbake command) to find out which recipe is causing the change? =C2=A0</=
div><div><br></div><div>Thanks again,</div><div>Charles</div><div><br></div=
></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Ap=
r 5, 2016 at 10:33 PM, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailto:=
liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
I think that it should be a bug, would you please try this patch?<br>
<br>
diff --git a/meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.=
14.bb" rel=3D"noreferrer" target=3D"_blank">base-files_3.0.14.bb</a> b/meta=
/recipes-core/base-files/<a href=3D"http://base-files_3.0.14.bb" rel=3D"nor=
eferrer" target=3D"_blank">base-files_3.0.14.bb</a><br>
index d391707..2082ed4 100644<br>
--- a/meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.14.bb" =
rel=3D"noreferrer" target=3D"_blank">base-files_3.0.14.bb</a><br>
+++ b/meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.14.bb" =
rel=3D"noreferrer" target=3D"_blank">base-files_3.0.14.bb</a><br>
@@ -95,6 +95,7 @@ do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in ${dirs755}; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 -d =
${D}$d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chmod 0700 ${D}${ROOT_HOME}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in ${dirs1777}; do<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 1777 -d =
${D}$d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
<br>
// Robert<span class=3D""><br>
<br>
On 04/06/2016 01:03 PM, Charles Chan wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
(This is my first post to OE list, hopefully I am posting to the right mail=
ing<br>
list.)<br>
<br>
Background: During the process of trying to configure SSH keys for root use=
r<br>
login via dropbear, we realized the permission for /home/root directory is =
set<br>
too loose for group and other members [1]. As a result, dropbears fails whe=
n we<br>
try to put the key under /home/root/.ssh<br>
<br>
---------<br>
<br>
In the image, /home/root directory is set to 0755:<br>
<br>
=C2=A0 =C2=A0 $ stat /home/root<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0File: /home/root<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Size: 4096=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Blocks: 8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IO Block: 4096=C2=A0 =C2=A0=
directory<br>
=C2=A0 =C2=A0 Device: b302h/45826d=C2=A0 =C2=A0 Inode: 13268=C2=A0 =C2=A0 =
=C2=A0 =C2=A0Links: 4<br>
=C2=A0 =C2=A0 Access: (0755/drwxr-xr-x)=C2=A0 Uid: (=C2=A0 =C2=A0 0/=C2=A0 =
=C2=A0 root)=C2=A0 =C2=A0Gid: (=C2=A0 =C2=A0 0/=C2=A0 =C2=A0 root)<br>
=C2=A0 =C2=A0 Access: 2016-04-05 22:21:13.000000000<br>
=C2=A0 =C2=A0 Modify: 2016-04-05 22:08:57.000000000<br>
=C2=A0 =C2=A0 Change: 2016-04-05 22:08:57.000000000<br>
<br>
<br>
After some debugging, we believe the permission (0755) is initialized in<br=
>
</span><a href=3D"http://base-files_3.0.14.bb" rel=3D"noreferrer" target=3D=
"_blank">base-files_3.0.14.bb</a> &lt;<a href=3D"http://base-files_3.0.14.b=
b" rel=3D"noreferrer" target=3D"_blank">http://base-files_3.0.14.bb</a>&gt;=
 (in line 35) [2].<span class=3D""><br>
<br>
A few questions:<br>
1. I tried looking at the git log for the history, but wasn&#39;t able to f=
ind any<br>
background on why the permission was set this way. eg. on a desktop Linux<b=
r>
(Ubuntu), /root is set to 0700:<br>
<br>
=C2=A0 =C2=A0 $ sudo stat /root<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0File: `/root&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Size: 4096 Blocks: 8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 IO Block: 4096=C2=A0 =C2=A0directory<br></span>
=C2=A0 =C2=A0 Device: 801h/2049dInode: 1441793=C2=A0 =C2=A0 =C2=A0Links: 3<=
span class=3D""><br>
=C2=A0 =C2=A0 Access: (0700/drwx------)=C2=A0 Uid: (=C2=A0 =C2=A0 0/=C2=A0 =
=C2=A0 root)=C2=A0 =C2=A0Gid: (=C2=A0 =C2=A0 0/=C2=A0 =C2=A0 root)<br>
=C2=A0 =C2=A0 Access: 2016-04-05 21:29:17.389725228 -0700<br>
=C2=A0 =C2=A0 Modify: 2016-03-22 17:11:54.912479000 -0700<br>
=C2=A0 =C2=A0 Change: 2016-03-22 17:11:54.912479000 -0700<br>
=C2=A0 =C2=A0 =C2=A0 Birth: -<br>
<br>
<br>
2. If we would like to override the directory permission for /home/root in =
our<br>
image, what is the best way to do it? I am not an expert with bitbake, shou=
ld I<br></span>
be patching the <a href=3D"http://base-files_3.0.14.bb" rel=3D"noreferrer" =
target=3D"_blank">base-files_3.0.14.bb</a> &lt;<a href=3D"http://base-files=
_3.0.14.bb" rel=3D"noreferrer" target=3D"_blank">http://base-files_3.0.14.b=
b</a>&gt;? using<span class=3D""><br>
*_append? or I should be looking at some other recipe altogether?<br>
<br>
Sorry for the long email. Thanks in advance.<br>
Charles<br>
<br>
[1] <a href=3D"https://wiki.openwrt.org/doc/howto/dropbear.public-key.auth#=
troubleshooting" rel=3D"noreferrer" target=3D"_blank">https://wiki.openwrt.=
org/doc/howto/dropbear.public-key.auth#troubleshooting</a><br>
<br>
[2]<br>
<a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded-core/tree/met=
a/recipes-core/base-files/base-files_3.0.14.bb?h=3Dmaster#n35" rel=3D"noref=
errer" target=3D"_blank">http://cgit.openembedded.org/cgit.cgi/openembedded=
-core/tree/meta/recipes-core/base-files/base-files_3.0.14.bb?h=3Dmaster#n35=
</a><br>
<br>
<br>
</span></blockquote>
</blockquote></div><br></div>

--001a113ee4ca770f8d052fd621bd--
