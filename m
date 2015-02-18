Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 22E8C6B6B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Feb 2015 08:45:54 +0000 (UTC)
Received: by iecat20 with SMTP id at20so47124067iec.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Feb 2015 00:45:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=Qr4Q4bIE9eNF9HMmAILgOOAPcAawBS/8mluX7rMFj6Q=;
	b=bDvKY9y1CmEIO+xwkm/Y0haTEumS55RVxJgHsinjlE2eZcP7Wn/ONNNjaNkZVElEw8
	5aqsEbg3uJXrFd2YcoAZAOCb8zo3VeekZMzNwhL5m7CSEPW6wzLDQK2cJfvsTBHwASPa
	W50uH7+rU7rRoLFDz230PJqG9OmMg8n+JUOJ6ouimyzG/WJzEU4iCc/ofB8vrYwr6nVq
	Yxeu/8A+8X8ECezfRK4mcfK1TcY5bRH9Ily+COZwtSykq3+0ml4nobXtF/I0If8q8JNO
	WDPFDFFGKxzPMtEx9mc7bS6dMlCsMCw5iH4FewffBzDOJuNNAL7of+NxoNeGVFU7OJOx
	oFYA==
X-Gm-Message-State: ALoCoQnWTgXW8GzLFNmGfle0eeuqsCvRzyZ86uamAJjnxIxsQFnxp2tbpxCsYxriau7OD1socFIU
X-Received: by 10.42.172.136 with SMTP id n8mr39081344icz.85.1424249156259;
	Wed, 18 Feb 2015 00:45:56 -0800 (PST)
Received: from pohly-mobl1 (p57A57C83.dip0.t-ipconnect.de. [87.165.124.131])
	by mx.google.com with ESMTPSA id t41sm12808862ioi.0.2015.02.18.00.45.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Feb 2015 00:45:55 -0800 (PST)
Message-ID: <1424249151.549.17.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Dan McGregor <danismostlikely@gmail.com>
Date: Wed, 18 Feb 2015 09:45:51 +0100
In-Reply-To: <CACS+7ZTaJgfBkDOzSsnPqoi+MCwo9_46sC1hr8o9NpQMGwkzhw@mail.gmail.com>
References: <1424180525-4138-1-git-send-email-patrick.ohly@intel.com>
	<54E3723B.9050606@windriver.com>
	<CABcZAN=4puvBHBwH72ioVdGHpfSO5kngJGCWrJgED8xO_4xQkw@mail.gmail.com>
	<54E375B2.9080002@windriver.com>
	<CACS+7ZTaJgfBkDOzSsnPqoi+MCwo9_46sC1hr8o9NpQMGwkzhw@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_rpm.bbclass: support packaging of symlinks to directories
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
X-List-Received-Date: Wed, 18 Feb 2015 08:45:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-02-17 at 21:40 -0600, Dan McGregor wrote:
> 
> On 17 Feb 2015 11:09, "Mark Hatle" <mark.hatle@windriver.com> wrote:
> >
> > On 2/17/15 10:57 AM, Christopher Larson wrote:
> > >
> > > On Tue, Feb 17, 2015 at 9:54 AM, Mark Hatle
> <mark.hatle@windriver.com
> > > <mailto:mark.hatle@windriver.com>> wrote:
> > > This patch doesn't make it walk into the directory symlinks, it moves them into
> > > the files list rather than the dirs list so they'll be captured themselves, as
> > > far as I can tell from reading it.
> >
> > Ok.. I missed that bit.. I'm still curious what this fixes.
> >
> 
> I haven't tried myself, but I expect it helps with the /usr merge.

Correct. I was working on a distro with a modified basefiles recipe
which only had /usr/[lib|bin|sbin] and symlinks to those in /. Without
this patch it was not possible to get these symlinks packaged in the
basefiles rpm.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




