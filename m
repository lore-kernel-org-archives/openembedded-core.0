Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB02.domain01.net (STOEXHUB02.domain01.net
	[83.145.59.143])
	by mail.openembedded.org (Postfix) with ESMTP id BB25C713A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 12:00:06 +0000 (UTC)
Received: from ad.chargestorm.se (2.68.123.242) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Wed, 12 Nov 2014 13:00:04 +0100
Date: Wed, 12 Nov 2014 12:59:29 +0100
From: Anders Darander <anders@chargestorm.se>
To: Chong Lu <Chong.Lu@windriver.com>
Message-ID: <20141112115929.GA13790@ad.chargestorm.se>
Mail-Followup-To: Chong Lu <Chong.Lu@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1414394124.git.Chong.Lu@windriver.com>
	<1c4ed8e4a604bcd7c7fd2609024f8fbfca43d1a4.1414394124.git.Chong.Lu@windriver.com>
	<20141027085931.GA27393@ad.chargestorm.se>
	<544E0F53.3010600@windriver.com>
MIME-Version: 1.0
In-Reply-To: <544E0F53.3010600@windriver.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
X-GFI-SMTP-Submission: 1
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: add bash to RDEPENDS
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
X-List-Received-Date: Wed, 12 Nov 2014 12:00:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Chong Lu <Chong.Lu@windriver.com> [141027 10:24]:
> On 10/27/2014 04:59 PM, Anders Darander wrote:
> > * Chong Lu <Chong.Lu@windriver.com> [141027 08:19]:
> >> systemd-216+gitAUTOINC+5d0ae62c66: systemd-kernel-install requires /bin/bash,
> >> but no providers in its RDEPENDS [file-rdeps]
> > How much bashisms are it in the files in systemd-kernel-install?
> > Would it be possible to to patch the scripts to use standard posixh sh
> > instead of bash?

> It has lots of bashisms:

> $ checkbashisms ./usr/bin/kernel-install
> possible bashism in ./usr/bin/kernel-install line 32 (local -opt):
>      local -a files
> possible bashism in ./usr/bin/kernel-install line 35 (readarray):
>      readarray -t files < <(

This one, readarray, might require some thought on how to make it
standard posix sh compatible...

> possible bashism in ./usr/bin/kernel-install line 38 (alternative test 
> command ([[ foo ]] should be [ foo ])):
>                  if [[ -e "$i" ]]; then

There's quite a few of these, that are easy to patch and upstream.

> possible bashism in ./usr/bin/kernel-install line 58 (should be 'b = a'):
>      if [ "$i" == "--help" -o "$i" == "-h" ]; then

Dito for these.

> possible bashism in ./usr/bin/kernel-install line 113 ('((' should be 
> '$(('):
>                  ((ret+=$?))

Likely dito.

So in summary, a large number of bashisms in kernel-install are easy to
fix.

Then there's a few that's a lot harder, all of these are using arrays
and readarray.

It would have been nice to see such a summary instead of only the rather
long report. If we can find another way to implement the code using
arrays, the complete patch should be upstreamable.

I'm currently not using kernel-install in any system, thus, due to
workload, I'm not going to be able to look into this at the moment.

Cheers,
Anders
-- 
Anders Darander
ChargeStorm AB / eStorm AB

