Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 527737723D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 07:42:20 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q128so1360544wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 00:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QUm++Ls/n0IgYZ3woGOfKbon71UjG1diBAGAd1Ai/ek=;
	b=c6YdmWlMZ6oJDcJqvsPxynYPSU8OXqbV4IetYi1RlIIy4lsteAkVPOAWOUlRN6eZT0
	kvXXhyyn0I5brc0HeevijTe3efCGA/jaIEdx2MVkSnT2CEWusJxllN1F6jV5t+cRztZy
	W6xCqqPNCXgWDblJvIohdcehPTj4BTXYns2YG0woMfx9ijIPrmvPv8GfR50dxzVrz/QN
	ijovCvL3QAyMu550Pq4Fi3PTJAi9lbdJhg8TZwcvAEr+RAr/Nypam9vzWqnMv1yAMVbR
	BHL/T760HXN4j2kb2oE9hAa/xRekcwKe7a76dLbAns451fMmXL1cqg8yCwxEBVkbarie
	fO+Q==
X-Gm-Message-State: AEkoouvjApQa8+Gjxl0cVXRgvJP4jTj4zMB9HN525yAuZ5Hb9F8KE4eHRiw1jiMIHE3GZg==
X-Received: by 10.28.39.133 with SMTP id n127mr1564890wmn.6.1470987740227;
	Fri, 12 Aug 2016 00:42:20 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	bw9sm6231971wjc.33.2016.08.12.00.42.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Aug 2016 00:42:19 -0700 (PDT)
Message-ID: <1470987751.4987.13.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 12 Aug 2016 08:42:31 +0100
In-Reply-To: <CAMKF1sqdpxYYrKnLkJ1VofY=qz5FEKsKWBo_7WrU+Cm_Kp1fDQ@mail.gmail.com>
References: <1470924371-1675-1-git-send-email-git@andred.net>
	<3A0FE7FC-807D-4CED-8673-DA28B5F36A88@gmail.com>
	<1470986810.4987.8.camel@andred.net>
	<CAMKF1sqdpxYYrKnLkJ1VofY=qz5FEKsKWBo_7WrU+Cm_Kp1fDQ@mail.gmail.com>
X-Mailer: Evolution 3.20.4-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH] libnl: musl fixes
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
X-List-Received-Date: Fri, 12 Aug 2016 07:42:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-08-12 at 00:28 -0700, Khem Raj wrote:
> On Fri, Aug 12, 2016 at 12:26 AM, André Draszik <git@andred.net> wrote:
> > 
> > On Thu, 2016-08-11 at 22:45 -0700, Khem Raj wrote:
> > > 
> > > > 
> > > > 
> > > > On Aug 11, 2016, at 7:06 AM, André Draszik <git@andred.net> wrote:
> > > > 
> > > > The libnl+musl combination has two issues at the moment:
> > > > a) a public header file #include's an incorrect file
> > > >   (sys/poll.h instead of poll.h), which causes warnings and
> > > >   potentially errors (-Werror) in a musl based system
> > > > b) musl only ever provides the XSI version of strerror_r()
> > > > 
> > > 
> > > yes so you can check for something like
> > > (_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600) && ! _GNU_SOURCE
> > > use XSI version
> > > else use GNU version
> > 
> > Well, the feature test is supposed to be set by the user (libnl in this
> > case), and evaluated by the c library (musl). libnl explicitly sets
> > _GNU_SOURCE, i.e. it expects the glibc version.
> 
> I see. It is something which should atleast be brought up with
> upstream as an issue
> they may just say, we need GNU version but atleast we will know

It's actually quite a bad thing... There might be many users (you mentioned
perf) out there which all are silently breaking because of this missing
interface in musl. If you look at the patch, in the musl case the result was
effectively a printf of an *int* with a *string format* specifier...

Maybe it'd be worth to convince musl to implement it (uclibc does), or at
least to emit an #error?

I only noticed by coincidence...


Cheers,
Andre'


