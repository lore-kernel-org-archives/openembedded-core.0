Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5294771C54
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 01:55:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w991tijq023306
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Oct 2018 18:55:44 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 8 Oct 2018 18:55:43 -0700
To: Martin Jansa <martin.jansa@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <cover.1538189779.git.Qi.Chen@windriver.com>
	<7e21f0e0a9d537ea22ccebab46ce5e4f4912d5ba.1538189779.git.Qi.Chen@windriver.com>
	<9e2836e7ec7b062fe9bcf06a498eea30f983eb65.camel@linuxfoundation.org>
	<CA+chaQdqVSwjnhUF0Ysj=-eucw9X14SO1Q0KqRa5zAh4Q-LP-g@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <139fc630-8a63-4de9-acb5-8082d6fbaa04@windriver.com>
Date: Tue, 9 Oct 2018 10:01:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQdqVSwjnhUF0Ysj=-eucw9X14SO1Q0KqRa5zAh4Q-LP-g@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] glibc: refresh patch to also fix qemuppc
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
X-List-Received-Date: Tue, 09 Oct 2018 01:55:45 -0000
Content-Type: multipart/alternative;
	boundary="------------189849758B0BF40FB3C93C77"

--------------189849758B0BF40FB3C93C77
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Richard, I'll consider more about maintenance issue next time.
Martin, thanks for taking care of this.

Best Regards,
Chen Qi

On 09/29/2018 08:55 PM, Martin Jansa wrote:
> I'm refreshing the patch based on feedback from upstream, I'll 
> integrate the changes for ppc as well.
>
> On Sat, Sep 29, 2018 at 2:26 PM Richard Purdie 
> <richard.purdie@linuxfoundation.org 
> <mailto:richard.purdie@linuxfoundation.org>> wrote:
>
>     On Sat, 2018-09-29 at 10:58 +0800, Chen Qi wrote:
>     > The patch 0031-sysdeps-ieee754-prevent-maybe-uninitialized-
>     > errors.patch
>     > did not take into consideration of qemuppc. Refresh it to also fix
>     > building for qemuppc.
>     >
>     > The related error message is like below:
>     >
>     >   ../sysdeps/ieee754/ldbl-128ibm/e_jnl.c:153:20: error: 'temp'
>     may be
>     > used uninitialized in this function [-Werror=maybe-uninitialized]
>     >
>     > Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     > ---
>     >  ...eee754-prevent-maybe-uninitialized-errors.patch | 41
>     > +++++++++++++++++-----
>     >  1 file changed, 32 insertions(+), 9 deletions(-)
>     >
>     > diff --git a/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-
>     > prevent-maybe-uninitialized-errors.patch b/meta/recipes-
>     > core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-
>     > errors.patch
>     > index b02c4ec..1c5b254 100644
>     > --- a/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-
>     > maybe-uninitialized-errors.patch
>     > +++ b/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-
>     > maybe-uninitialized-errors.patch
>     > @@ -1,4 +1,4 @@
>     > -From c6cc5a6ef46837e341fe271b5ffa6def23810082 Mon Sep 17 00:00:00
>     > 2001
>     > +From 113241a738662854256c5e2e415397721b842862 Mon Sep 17 00:00:00
>     > 2001
>     >  From: Martin Jansa <Martin.Jansa@gmail.com
>     <mailto:Martin.Jansa@gmail.com>>
>     >  Date: Fri, 14 Sep 2018 23:23:03 +0000
>     >  Subject: [PATCH] sysdeps/ieee754: prevent maybe-uninitialized
>     errors
>     > @@ -21,13 +21,14 @@ Upstream-Status: Submitted
>     [https://www.sourcewar
>     > e.org/ml/libc-alpha/2018-09/msg
>     <http://e.org/ml/libc-alpha/2018-09/msg>
>
>     I get nervous when we modify a patch submitted upstream. Was the patch
>     submitted accepted? Do we need to send this other piece upstream?
>
>     Cheers,
>
>     Richard
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--------------189849758B0BF40FB3C93C77
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Richard, I'll consider more about
      maintenance issue next time.<br>
      Martin, thanks for taking care of this.<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      On 09/29/2018 08:55 PM, Martin Jansa wrote:<br>
    </div>
    <blockquote
cite="mid:CA+chaQdqVSwjnhUF0Ysj=-eucw9X14SO1Q0KqRa5zAh4Q-LP-g@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">I'm refreshing the patch based on feedback from
        upstream, I'll integrate the changes for ppc as well.</div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr">On Sat, Sep 29, 2018 at 2:26 PM Richard Purdie
          &lt;<a moz-do-not-send="true"
            href="mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sat,
          2018-09-29 at 10:58 +0800, Chen Qi wrote:<br>
          &gt; The patch
          0031-sysdeps-ieee754-prevent-maybe-uninitialized-<br>
          &gt; errors.patch<br>
          &gt; did not take into consideration of qemuppc. Refresh it to
          also fix<br>
          &gt; building for qemuppc.<br>
          &gt; <br>
          &gt; The related error message is like below:<br>
          &gt; <br>
          &gt;   ../sysdeps/ieee754/ldbl-128ibm/e_jnl.c:153:20: error:
          'temp' may be<br>
          &gt; used uninitialized in this function
          [-Werror=maybe-uninitialized]<br>
          &gt; <br>
          &gt; Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
            href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;<br>
          &gt; ---<br>
          &gt;  ...eee754-prevent-maybe-uninitialized-errors.patch | 41<br>
          &gt; +++++++++++++++++-----<br>
          &gt;  1 file changed, 32 insertions(+), 9 deletions(-)<br>
          &gt; <br>
          &gt; diff --git
          a/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-<br>
          &gt; prevent-maybe-uninitialized-errors.patch b/meta/recipes-<br>
          &gt;
          core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-<br>
          &gt; errors.patch<br>
          &gt; index b02c4ec..1c5b254 100644<br>
          &gt; ---
          a/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-<br>
          &gt; maybe-uninitialized-errors.patch<br>
          &gt; +++
          b/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-<br>
          &gt; maybe-uninitialized-errors.patch<br>
          &gt; @@ -1,4 +1,4 @@<br>
          &gt; -From c6cc5a6ef46837e341fe271b5ffa6def23810082 Mon Sep 17
          00:00:00<br>
          &gt; 2001<br>
          &gt; +From 113241a738662854256c5e2e415397721b842862 Mon Sep 17
          00:00:00<br>
          &gt; 2001<br>
          &gt;  From: Martin Jansa &lt;<a moz-do-not-send="true"
            href="mailto:Martin.Jansa@gmail.com" target="_blank">Martin.Jansa@gmail.com</a>&gt;<br>
          &gt;  Date: Fri, 14 Sep 2018 23:23:03 +0000<br>
          &gt;  Subject: [PATCH] sysdeps/ieee754: prevent
          maybe-uninitialized errors<br>
          &gt; @@ -21,13 +21,14 @@ Upstream-Status: Submitted [<a
            moz-do-not-send="true" href="https://www.sourcewar"
            rel="noreferrer" target="_blank">https://www.sourcewar</a><br>
          &gt; <a moz-do-not-send="true"
            href="http://e.org/ml/libc-alpha/2018-09/msg"
            rel="noreferrer" target="_blank">e.org/ml/libc-alpha/2018-09/msg</a><br>
          <br>
          I get nervous when we modify a patch submitted upstream. Was
          the patch<br>
          submitted accepted? Do we need to send this other piece
          upstream?<br>
          <br>
          Cheers,<br>
          <br>
          Richard<br>
          <br>
          -- <br>
          _______________________________________________<br>
          Openembedded-core mailing list<br>
          <a moz-do-not-send="true"
            href="mailto:Openembedded-core@lists.openembedded.org"
            target="_blank">Openembedded-core@lists.openembedded.org</a><br>
          <a moz-do-not-send="true"
            href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
            rel="noreferrer" target="_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------189849758B0BF40FB3C93C77--
