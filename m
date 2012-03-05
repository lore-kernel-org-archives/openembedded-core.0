Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S4XqP-0006V6-76
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 14:20:53 +0100
Received: by pbbrp12 with SMTP id rp12so3908098pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2012 05:12:17 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.adami@gmail.com designates
	10.68.135.68 as permitted sender) client-ip=10.68.135.68; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrea.adami@gmail.com
	designates 10.68.135.68 as permitted sender)
	smtp.mail=andrea.adami@gmail.com;
	dkim=pass header.i=andrea.adami@gmail.com
Received: from mr.google.com ([10.68.135.68])
	by 10.68.135.68 with SMTP id pq4mr10932762pbb.71.1330953137585
	(num_hops = 1); Mon, 05 Mar 2012 05:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=60bKPS2thPpgaYecCH40uwKmdn15ZP9G3Vci2HGmPpU=;
	b=0vlOarO+M1juY6dWVasVEhFXs+YKlZ3MHgIyhNtUR22X6QQKRBvu4U8F5Fy/OyZLO4
	H1oELktD48TZiGk8adAsNUHt/O3Z+BInA6dyUGpuAG59hvgz2Qw5+co+OLTLRowgcmGw
	FJaKcGUeRpZhKnElu1Hm8OIH39qC160JW5vvfD6Wro9nVJF4IkdpOf9xrlwitdqRhgj2
	RwK4reAAIDsdHrY2TNNvPYaSKcgPFJroYEssafNSBVl8U7bq2NaX7j7bt0y30IRpYHzv
	v96k9bInpMb/gGvTw2Bw8Z+3rfZ/kWbQk7UszHqRM/BRQ8Ysk7fkYfgOP2Pb3h9YXJJE
	6Xgg==
MIME-Version: 1.0
Received: by 10.68.135.68 with SMTP id pq4mr9444945pbb.71.1330953137411; Mon,
	05 Mar 2012 05:12:17 -0800 (PST)
Received: by 10.143.67.8 with HTTP; Mon, 5 Mar 2012 05:12:17 -0800 (PST)
In-Reply-To: <CAAQYJAtC-SCxohUjEOcixWA_B+K62O9AMr-d4XWX+PBDpg6i=w@mail.gmail.com>
References: <CAAQYJAtC-SCxohUjEOcixWA_B+K62O9AMr-d4XWX+PBDpg6i=w@mail.gmail.com>
Date: Mon, 5 Mar 2012 14:12:17 +0100
Message-ID: <CAAQYJAvQajmU+T1oGQLingBR7S7_G_A3KxtDeB+s6_tNnmoteg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] keymaps and kernel version
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
X-List-Received-Date: Mon, 05 Mar 2012 13:20:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 4, 2012 at 12:40 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> Hi,
> while testing some new kernels I found out a broken keymap.
> After short research I could identify the cause in
> recipes-bsp/keymaps/files/keymap.sh:
> ...
> KERNEL_MAJMIN=3D`uname -r | cut -d '.' -f 1,2`
> if [ -e /etc/keymap-$KERNEL_MAJMIN.map ]; then
> =A0 =A0loadkeys /etc/keymap-$KERNEL_MAJMIN.map
> fi
> ...
>
> $ uname -r | cut -d '.' -f 1,2
> 3.2
>
>
> I realized we are still using some old keymap-2.6.map and this doesn't
> match with KERNEL_MAJMIN.
> Now, renaming the keymaps to 3.2 would be only a band-aid, =A03.3 is comi=
ng.
>
> Maybe we should check for keymap-3.map, i.e.
>
> =A0uname -r | cut -d '.' -f 1,1
>
> =A0or embed the machine name instead.
>
> Regards
>
> Andrea

Actually this all sounds remnant of linux 2.4 vs. 2.6 times.

Probably today we can just set:
...
if [ -e /etc/keymap.map ]; then
...

and the BSP layers will have to rename the overrides only once.

My 2 cents

Andrea


