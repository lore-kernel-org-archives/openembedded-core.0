Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E02CE73D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 03:28:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7C3S65Z008589
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 11 Aug 2016 20:28:06 -0700
Received: from [128.224.162.229] (128.224.162.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 11 Aug 2016 20:28:05 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1470636212.git.Qi.Chen@windriver.com>
	<8374cee610f770f4e027f92785bc0bed13334fbb.1470636212.git.Qi.Chen@windriver.com>
	<CAJTo0LaULRXouHYMfKCMUmtFERseR9vZhWXeC-yK9GLrMTwofQ@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <57AD4247.7080704@windriver.com>
Date: Fri, 12 Aug 2016 11:28:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaULRXouHYMfKCMUmtFERseR9vZhWXeC-yK9GLrMTwofQ@mail.gmail.com>
X-Originating-IP: [128.224.162.229]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bitbake.conf: change localedir
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
X-List-Received-Date: Fri, 12 Aug 2016 03:28:10 -0000
Content-Type: multipart/alternative;
	boundary="------------080403070204080903030206"

--------------080403070204080903030206
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2016 12:26 AM, Burton, Ross wrote:
>
> On 8 August 2016 at 07:04, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     Previously, localedir is set to "${libdir}/locale". This would result
>     in locale database installed in '/usr/lib64/locale' in some
>     multilib case.
>     For example, if we build out a multilib x86-64 self-hosted image
>     and we try
>     to build projects on this host, things broke and the following
>     error appears.
>
>       Please use a locale setting which supports utf-8.
>       Python can't change the filesystem locale after loading so we
>     need a utf-8 when python starts or things won't work.
>
>     This is because '/usr/lib/locale' is the default one. And actually the
>     nativesdk-glibc is now set to use '/usr/lib/locale'.
>
>
> This is irrelevant as nativesdk-glibc is configured to read the 
> *hosts* locale directory.

Hi Ross,

I think I didn't state things clearly. Sorry for that.
I mentioned nativesdk-glibc because of the following use case.
On a self-hosted image, which is built out by Yocto, we install 
buildtools-tarball, make use of it and start building. This is why I 
mentioned nativesdk-glibc.


>     Thus, we change the setting of 'localedir' to
>     '${nonarch_libdir}/locale' to
>     fix the above problem.
>
>
> I see two issues here:
> 1) should binary locales be considered shared in multilib 
> environments? (libdir vs nonarch_libdir)

I think yes.
Below is something from glibc source. The file is 
git/sysdeps/unix/sysv/linux/x86_64/64/configure.

     # Locale data can be shared between 32-bit and 64-bit libraries.
     libc_cv_complocaledir='${exec_prefix}/lib/locale'

You can see that it states clearly that the binary data could be shared 
and it uses 'lib'.

> 2) what packages are not respecting this variable and hard-coding 
> /usr/lib/locale?
>

I don't know. But the manual of locale has stated clearly that 
'/usr/lib/locale' is the default directory.
Something from the manual below.

        LOCPATH

                The directory where locale data is stored.  By default, 
/usr/lib/locale is used.


> I'm guessing WR think yes to (1), and is the glibc patch you also sent 
> the fundamental fix to (2)?
>

I don't know why the glibc patch is needed.
At a first glance, I think it might be related to 
GLIBC_INTERNAL_USE_BINARY_LOCALE handling. The value of this variable is 
overridden in our bbappend file.
This might also be related to cross-localedef recipe.

Best Regards,
Chen Qi

> Ross


--------------080403070204080903030206
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 08/12/2016 12:26 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LaULRXouHYMfKCMUmtFERseR9vZhWXeC-yK9GLrMTwofQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 8 August 2016 at 07:04, Chen Qi <span
              dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":1ir" class="a3s aXjCH m15668c12753f49ff">Previously,
                localedir is set to "${libdir}/<span class="il">locale</span>".
                This would result<br>
                in <span class="il">locale</span> database installed in
                '/usr/lib64/<span class="il">locale</span>' in some
                multilib case.<br>
                For example, if we build out a multilib x86-64
                self-hosted image and we try<br>
                to build projects on this host, things broke and the
                following error appears.<br>
                <br>
                  Please use a <span class="il">locale</span> setting
                which supports utf-8.<br>
                  Python can't change the filesystem <span class="il">locale</span>
                after loading so we need a utf-8 when python starts or
                things won't work.<br>
                <br>
                This is because '/usr/lib/<span class="il">locale</span>'
                is the default one. And actually the<br>
                nativesdk-glibc is now set to use '/usr/lib/<span
                  class="il">locale</span>'.<br>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>This is irrelevant as nativesdk-glibc is configured to
              read the *hosts* locale directory.</div>
            <div> </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Hi Ross,<br>
    <br>
    I think I didn't state things clearly. Sorry for that.<br>
    I mentioned nativesdk-glibc because of the following use case.<br>
    On a self-hosted image, which is built out by Yocto, we install
    buildtools-tarball, make use of it and start building. This is why I
    mentioned nativesdk-glibc.<br>
    <br>
    <br>
    <blockquote
cite="mid:CAJTo0LaULRXouHYMfKCMUmtFERseR9vZhWXeC-yK9GLrMTwofQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":1ir" class="a3s aXjCH m15668c12753f49ff">
                Thus, we change the setting of 'localedir' to
                '${nonarch_libdir}/<span class="il">locale</span>' to<br>
                fix the above problem.</div>
            </blockquote>
          </div>
          <br>
          I see two issues here:</div>
        <div class="gmail_extra">1) should binary locales be considered
          shared in multilib environments? (libdir vs nonarch_libdir)</div>
      </div>
    </blockquote>
    <br>
    I think yes.<br>
    Below is something from glibc source. The file is
    git/sysdeps/unix/sysv/linux/x86_64/64/configure.<br>
    <br>
        # Locale data can be shared between 32-bit and 64-bit libraries.<br>
        libc_cv_complocaledir='${exec_prefix}/lib/locale'<br>
    <br>
    You can see that it states clearly that the binary data could be
    shared and it uses 'lib'.<br>
    <br>
    <blockquote
cite="mid:CAJTo0LaULRXouHYMfKCMUmtFERseR9vZhWXeC-yK9GLrMTwofQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">2) what packages are not respecting
          this variable and hard-coding /usr/lib/locale?</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    <br>
    I don't know. But the manual of locale has stated clearly that
    '/usr/lib/locale' is the default directory.<br>
    Something from the manual below.<br>
    <br>
           LOCPATH<br>
    <br>
                   The directory where locale data is stored.  By
    default, /usr/lib/locale is used.<br>
    <br>
    <br>
    <blockquote
cite="mid:CAJTo0LaULRXouHYMfKCMUmtFERseR9vZhWXeC-yK9GLrMTwofQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">I'm guessing WR think yes to (1), and
          is the glibc patch you also sent the fundamental fix to (2)?</div>
        <div class="gmail_extra"><br>
        </div>
      </div>
    </blockquote>
    <br>
    I don't know why the glibc patch is needed.<br>
    At a first glance, I think it might be related to
    GLIBC_INTERNAL_USE_BINARY_LOCALE handling. The value of this
    variable is overridden in our bbappend file.<br>
    This might also be related to cross-localedef recipe.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CAJTo0LaULRXouHYMfKCMUmtFERseR9vZhWXeC-yK9GLrMTwofQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------080403070204080903030206--
