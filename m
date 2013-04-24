Received: from mail-vb0-f44.google.com ([209.85.212.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UUzcw-0007lE-2s
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 15:20:55 +0200
Received: by mail-vb0-f44.google.com with SMTP id e12so1654888vbg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2013 06:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=ncA0GsqL2aSjg0Vpc7+2vNyK76ywe4muHrLB/DbJCro=;
	b=k8h/pnIkIMiZLQO/AIokQ88Luy9C87rPCFHU5M4BYReMKIWGxZn65FjWypoqFmgwRT
	hKQGW7X7iwUBvfDZbhNt8MDwQbOcujI8xQMDnYnHe5Aax1yJgPRbzThDupNmEJUvrxOk
	dckNxuaxT0x/HMVIb59SRquftsLssyQ9c5v7E3ObMB1AwlqpXza5HMtpUMdJlofHIsiX
	+D54gj93vhfLtnZr8vmMl4M5GHrOXeTcls1LF/cXn64UTwvgDu4/mWPEc1R3J//3l70g
	5FI+/ASibLmbQeULnLGf9iH/5/7xegeOhBRHj4YPSj4GgkrhLXDBilTV3/4rO7L2ugEx
	PArQ==
MIME-Version: 1.0
X-Received: by 10.52.68.51 with SMTP id s19mr21304592vdt.92.1366808587722;
	Wed, 24 Apr 2013 06:03:07 -0700 (PDT)
Received: by 10.52.183.36 with HTTP; Wed, 24 Apr 2013 06:03:07 -0700 (PDT)
In-Reply-To: <20130424123608.GI3217@jama>
References: <CALbNGRQ4vS=kvgqNZyS5G9HRBE1ixrta_uF+PvzOPZvfjbhNkQ@mail.gmail.com>
	<20130424123608.GI3217@jama>
Date: Wed, 24 Apr 2013 15:03:07 +0200
Message-ID: <CALbNGRTXKY4yNOOM4-qqWYXrT0NgU3pZjEsvKhT0CwVhGVvDWQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: postinst questions (was postinst does not finish)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Apr 2013 13:20:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2013 at 2:36 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Wed, Apr 24, 2013 at 02:04:39PM +0200, Andreas M=C3=BCller wrote:
>> Hi
>>
>> as written before: an 'exit 1' within recipe's postinst causes
>> trouble. E.g meta-oe's lxdm does not run systemd.bbclass' code which
>> leaves lxdm in unprepared condition causing start too early and ending
>> in unfinished postinstall.
>>
>> A simple workaround for this (we should think of something else later)
>> would be to prepend postinst code within systemd.bbclass (and maybe
>> others too) instead of appending. Hereby we ensure that the code is
>> executed independent of recipe's code. First question: Any objections?
>>
>> In case of no objections: Second question: Is shebang in
>> post/pre/install/remove scripts (I saw many scripts without shebang)?
>
> When looking for something else I've noticed
> package.bbclass:do_split_packages
>     if postinst:
>         postinst =3D '#!/bin/sh\n' + postinst + '\n'
>     if postrm:
>         postrm =3D '#!/bin/sh\n' + postrm + '\n'
This code is not run - at least for many many recipes. I modified it
for test purpose but did not find my modifications anywhere...

Andreas


