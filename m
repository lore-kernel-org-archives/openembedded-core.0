Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1S67f8-0003IQ-Vj
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 22:47:47 +0100
Received: by dado14 with SMTP id o14so1561378dad.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2012 13:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=eLye6aPK5MlHnImzFI9o62+su3I0v1OWDkb6EHtDpsQ=;
	b=Drxj3PMye4wUQDIJA99jevzfwvrqQLYsfOzLPKEk5LdfGob4dFhwbg78kNvqIZTOnn
	xfhKhIXx2YjRtSpYO+Mcn//uvfdHzRL/wtYX44rZjVC+AiplwxgRXUzGg7ZKPzd90gNG
	gdtxD7Z2+Ax/ij/El9/IhNNqofBpd7ttrSAIrmqpgnr0vRj3Z0ZxWDSjjtPdOV7reJmt
	Ds6MWnPpaopAYDZ8o/+5VnsjQ7Wp9CIEoyN7haonAwKX5Y//swNQEST2xApu85DL5k+H
	ejbbYyb1bU00sNaG4obF06cjPJrjTtTpGeKyELE2sg4LDNEUUjcTf2esPyOz2M3a+302
	kKuQ==
MIME-Version: 1.0
Received: by 10.68.136.228 with SMTP id qd4mr6747224pbb.141.1331329146182;
	Fri, 09 Mar 2012 13:39:06 -0800 (PST)
Received: by 10.142.148.18 with HTTP; Fri, 9 Mar 2012 13:39:06 -0800 (PST)
Date: Fri, 9 Mar 2012 14:39:06 -0700
Message-ID: <CA+M6bXkMdv_bg9bDOYCS=Ng0sSB+2Yu6xRN4V0tKDV9RCJMy+A@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Consistency and use cases for IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 09 Mar 2012 21:47:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hey all,

Over in meta-ti I kicked off a discussion
(https://lists.yoctoproject.org/pipermail/meta-ti/2012-March/000779.html)
about if we should be using '?=' or '+=' with IMAGE_FSTYPES in the
machine conf files.  This has been discussed a little bit before
(http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/2060/focus=2061).
 The problem is we have the following and I believe ultimately
conflicting use cases:
- The machine needs to say 'I need or support the following formats'
- The distro needs to say 'I always want format X'
- The user needs to say 'I know best, give me only format X'
- The user needs to say 'I know best, give me what you support + X'

We achieve this today, but not very nicely.  For the last one you need
to start playing order of operations games and that's just not nice.
My suggestion is that we need to change what the machine.conf sets to
another variable (SOMETHING_IMAGE_FSTYPES), and a default
IMAGE_FSTYPES becomes ?= ${SOMETHING_IMAGE_FSTYPES}.  Distros, and
users can then work more easily with their use cases.  Comments?

-- 
Tom


