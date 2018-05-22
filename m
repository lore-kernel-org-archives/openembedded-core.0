Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BF49F749A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 12:51:15 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w4MCpEum009736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 22 May 2018 13:51:15 +0100
Message-ID: <1526993474.8937.159.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>,
	openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2018 13:51:14 +0100
In-Reply-To: <e440da5fb5a559e1041a738915a154b5a9915047.camel@andred.net>
References: <20180522122553.29109-1-git@andred.net>
	<1526992613.8937.155.camel@linuxfoundation.org>
	<e440da5fb5a559e1041a738915a154b5a9915047.camel@andred.net>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 1/4] sstate: allow specifying indirect dependencies to exclude from sysroot
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
X-List-Received-Date: Tue, 22 May 2018 12:51:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-05-22 at 13:48 +0100, André Draszik wrote:
> > Have you looked at the performance impact of this change? It looks
> > like
> > it will be compiling the regexp each time inside a tight loop which
> > gets called once per task dependency which will show up
> > significantly
> > on the performance chart.
> True, and no, I haven't. Is there a good way to compare the
> performance with
> and without this change other than using 'time'?

I'd try something like "bitbake <image> -P -n" which should generate a
profile output for the dry run of building the image. That would not
build anything but would include all the dependency calculations (and
unfortunately all the fork overheadin this case).

> > 
> > We already have a "*" syntax used in
> > SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
> > and I'd rather use that syntax here to avoid the use of re if we
> > can
> > help it. Could you see if that is possible please? That would also
> > keep
> > the syntax compatible.
> OK.

I think it uses glob btw which is much lighter weight than re.

Cheers,

Richard

