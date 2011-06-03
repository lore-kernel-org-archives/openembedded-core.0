Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QSWe9-0004mi-NP
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 17:50:49 +0200
Received: by vxd7 with SMTP id 7so1678947vxd.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jun 2011 08:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=vst0nLsMv7lQqf172tGeVHGkQ1ROvzOZ03OMFqvGvVc=;
	b=gE7AeAvQo6UAQ/EmqrCTfRgfckRLIC9EGzZFslZTPB2S37Kwt5RqCBMQdHno6MKud2
	RlKLMj7JRpl9Uillq0lMFt1ny/WwoiOg6SuZ4K5An7WIJsdfMoU4NfZynLr60c1MoFIH
	JDInOgL4eN0w9dN7t5uKD7fLiC2dsqI4yTb8k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=Y+59fGDmlTxiePY792IA1zx/i5d5mFzCXRZIy18SWUZsfm56HZZTyg+fQYH92fn/xh
	iQX/OlNSni6MMb//x1cLLnDH4+Pe3K66Pk6h0WL1LYCfAaC5C8gj9TYzcE98b9AnlJzL
	TQjW4tsOXnm105QgDRLh6NusaB1BqeCrljmDI=
Received: by 10.52.111.131 with SMTP id ii3mr79873vdb.235.1307116055062; Fri,
	03 Jun 2011 08:47:35 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.101.134 with HTTP; Fri, 3 Jun 2011 08:47:15 -0700 (PDT)
In-Reply-To: <1307115801.2529.350.camel@phil-desktop>
References: <4DE56B0D.4020209@intel.com> <4DE87AD1.1050004@linux.intel.com>
	<4DE8EE32.9060905@windriver.com>
	<1307115801.2529.350.camel@phil-desktop>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 3 Jun 2011 08:47:15 -0700
X-Google-Sender-Auth: ss5NcMYijXR9blbCSAGiP8-sJzg
Message-ID: <BANLkTi=n+MNMu+EY0F5Hh3OqVe7Ex7CCQg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Tell me your build error message annoyances!
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Jun 2011 15:50:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 3, 2011 at 8:43 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Fri, 2011-06-03 at 09:22 -0500, Mark Hatle wrote:
>> I believe currently we have around 3-5 messages per step, and it's still=
 too
>> noisy -- unless you need to debug something.
>
> Correct. =C2=A0Right now, the output looks like:
>
> NOTE: Running task 613 of 728 (ID: 190, virtual:native:/home/pb/oe/oe-cor=
e/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_install)
> NOTE: package util-linux-native-2.19.1-r0: task do_install: Started
> NOTE: package util-linux-native-2.19.1-r0: task do_install: Succeeded
> NOTE: Running task 614 of 728 (ID: 191, virtual:native:/home/pb/oe/oe-cor=
e/meta/recipes-core/util-linux/util-linux_2.19.1.bb, do_populate_sysroot)
> NOTE: package util-linux-native-2.19.1-r0: task do_populate_sysroot: Star=
ted
> NOTE: package util-linux-native-2.19.1-r0: task do_populate_sysroot: Succ=
eeded
>
> It looks as though the "Started" and "Succeeded" lines could just be
> deleted without losing any real information.

Heh, I used to have a personal branch where I dropped those, and also
removed the unnecessary NOTE: prefix. I think its a given that
something that doesn't indicate a warning or an error is simply
informative :) The problem with dropping those messages is for
postprocessing scripts, which may well want/need to know when a task
completes, not just when it starts. Still, yet another case of
something we could drop as long as we log it. We need to add a main
bitbake execution log that captures everything, including debug
messages, whether the user specifies -D or not.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


