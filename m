Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 151E161013
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 02:28:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r782SilI008373
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Aug 2013 19:28:44 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 7 Aug 2013 19:28:44 -0700
Message-ID: <52030272.6050709@windriver.com>
Date: Thu, 8 Aug 2013 10:29:06 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1375862591.git.Qi.Chen@windriver.com>
	<3ea48b1c837fd67e81f367ff6943cae9f7fbeb33.1375862591.git.Qi.Chen@windriver.com>
	<CABcZAN=kKF1cLeCR+SMenSBG2bRxVd==GR727XN-h72FW2ZT2w@mail.gmail.com>
	<5202FE14.70101@windriver.com>
	<CAMKF1sqwzMQb5W2+2VdASiDi2J+R_9gNWAFU0dAftqBtTgVipA@mail.gmail.com>
In-Reply-To: <CAMKF1sqwzMQb5W2+2VdASiDi2J+R_9gNWAFU0dAftqBtTgVipA@mail.gmail.com>
X-Originating-IP: [128.224.162.233]
Cc: Chris Larson <clarson@kergoth.com>, "chen_q07@163.com" <chen_q07@163.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4 09/10] irda-utils: fix for read-only rootfs
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
X-List-Received-Date: Thu, 08 Aug 2013 02:28:53 -0000
Content-Type: multipart/alternative;
	boundary="------------020606050204060303010301"

--------------020606050204060303010301
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2013 10:23 AM, Khem Raj wrote:
>
>
> On Wednesday, August 7, 2013, ChenQi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
> > On 08/07/2013 10:18 PM, Chris Larson wrote:
> >
> > On Wed, Aug 7, 2013 at 1:08 AM, <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
> >>
> >> From: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
> >>
> >> The init script for irda writes configuration items to 
> /etc/sysconfig/irda
> >> if that file is not available in system. But it's actually not 
> necessary,
> >> the behavior doesn't change whether the init script writes to the 
> file or not.
> >>
> >> Considering it issues error messages in case of a read-only rootfs, 
> I delete
> >> the writing process.
> >>
> >> [YOCTO #4103]
> >> [YOCTO #4886]
> >>
> >> Signed-off-by: Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>>
> >
> > This is a start, but is incomplete, from what I can tell. As 
> mentioned in the other thread, the startup script shouldn't be using 
> /etc/sysconfig/ at all, in any form. We use /etc/default/ for our 
> startup script config files, not /etc/sysconfig/.
> >
> > Yeah, I agree with you.
> > But when I checked the irda source code, I saw that it actually 
> could ship its own init script (irda-utils-xxx/etc/irda.rc). And I 
> think our init script is derived from this one. In its own init 
> script, /etc/sysconfig is used.
> > (Of course, I still think /etc/default is a better location for its 
> configuration file.)
> >
> >
> > Also, the purpose of this block was clearly to implement a default 
> configuration, yet the recipe isn't altered to ship a default 
> configuration to provide equivalent functionality.
> >
> > In its source code, there's a default configuration file, and we 
> don't use that. I think there might be a reason.
> > So I'm not sure about this one.
> >
> > If you have a patch to fix the irda issue properly, send it out and 
> I'll rebase my remote branch and drop this one.
>
> Whether Chris has a patch or not this patch in its form should be 
> dropped since there is a better way to do it
>

Shipping a default configuration file or using /etc/default as the 
configuration directory? Or something else?

//Chen Qi

> >
> > Best Regards,
> > Chen Qi
> >
> >
> > --
> > Christopher Larson
> > clarson at kergoth dot com
> > Founder - BitBake, OpenEmbedded, OpenZaurus
> > Maintainer - Tslib
> > Senior Software Engineer, Mentor Graphics
> > 


--------------020606050204060303010301
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 08/08/2013 10:23 AM, Khem Raj wrote:<br>
    </div>
    <blockquote
cite="mid:CAMKF1sqwzMQb5W2+2VdASiDi2J+R_9gNWAFU0dAftqBtTgVipA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <br>
      <br>
      On Wednesday, August 7, 2013, ChenQi &lt;<a moz-do-not-send="true"
        href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;
      wrote:<br>
      &gt; On 08/07/2013 10:18 PM, Chris Larson wrote:<br>
      &gt;<br>
      &gt; On Wed, Aug 7, 2013 at 1:08 AM, &lt;<a moz-do-not-send="true"
        href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;
      wrote:<br>
      &gt;&gt;<br>
      &gt;&gt; From: Chen Qi &lt;<a moz-do-not-send="true"
        href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
      &gt;&gt;<br>
      &gt;&gt; The init script for irda writes configuration items to
      /etc/sysconfig/irda<br>
      &gt;&gt; if that file is not available in system. But it's
      actually not necessary,<br>
      &gt;&gt; the behavior doesn't change whether the init script
      writes to the file or not.<br>
      &gt;&gt;<br>
      &gt;&gt; Considering it issues error messages in case of a
      read-only rootfs, I delete<br>
      &gt;&gt; the writing process.<br>
      &gt;&gt;<br>
      &gt;&gt; [YOCTO #4103]<br>
      &gt;&gt; [YOCTO #4886]<br>
      &gt;&gt;<br>
      &gt;&gt; Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
        href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;<br>
      &gt;<br>
      &gt; This is a start, but is incomplete, from what I can tell. As
      mentioned in the other thread, the startup script shouldn't be
      using /etc/sysconfig/ at all, in any form. We use /etc/default/
      for our startup script config files, not /etc/sysconfig/.<br>
      &gt;<br>
      &gt; Yeah, I agree with you.<br>
      &gt; But when I checked the irda source code, I saw that it
      actually could ship its own init script
      (irda-utils-xxx/etc/irda.rc). And I think our init script is
      derived from this one. In its own init script, /etc/sysconfig is
      used.<br>
      &gt; (Of course, I still think /etc/default is a better location
      for its configuration file.)<br>
      &gt;<br>
      &gt;<br>
      &gt; Also, the purpose of this block was clearly to implement a
      default configuration, yet the recipe isn't altered to ship a
      default configuration to provide equivalent functionality.<br>
      &gt;<br>
      &gt; In its source code, there's a default configuration file, and
      we don't use that. I think there might be a reason.<br>
      &gt; So I'm not sure about this one.<br>
      &gt;<br>
      &gt; If you have a patch to fix the irda issue properly, send it
      out and I'll rebase my remote branch and drop this one.<br>
      <br>
      Whether Chris has a patch or not this patch in its form should be
      dropped since there is a better way to do it<br>
      <br>
    </blockquote>
    <br>
    Shipping a default configuration file or using /etc/default as the
    configuration directory? Or something else?<br>
    <br>
    //Chen Qi<br>
    <br>
    <blockquote
cite="mid:CAMKF1sqwzMQb5W2+2VdASiDi2J+R_9gNWAFU0dAftqBtTgVipA@mail.gmail.com"
      type="cite">&gt;<br>
      &gt; Best Regards,<br>
      &gt; Chen Qi<br>
      &gt;<br>
      &gt;<br>
      &gt; --<br>
      &gt; Christopher Larson<br>
      &gt; clarson at kergoth dot com<br>
      &gt; Founder - BitBake, OpenEmbedded, OpenZaurus<br>
      &gt; Maintainer - Tslib<br>
      &gt; Senior Software Engineer, Mentor Graphics<br>
      &gt;
    </blockquote>
    <br>
  </body>
</html>

--------------020606050204060303010301--
