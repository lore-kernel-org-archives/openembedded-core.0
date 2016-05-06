Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7B4CC6E630
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 10:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u46AmZH6023059; Fri, 6 May 2016 11:49:28 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YJWDyRaHOvBA; Fri,  6 May 2016 11:49:28 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u46AnM9P023140
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 6 May 2016 11:49:24 +0100
Message-ID: <1462531762.21674.135.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Kucharczyk, Bartlomiej (Nokia - PL/Wroclaw)"
	<bartlomiej.kucharczyk@nokia.com>, EXT Christopher Larson
	<clarson@kergoth.com>
Date: Fri, 06 May 2016 11:49:22 +0100
In-Reply-To: <AM3PR07MB22889D01AF1F38A1664FBB3F97D0@AM3PR07MB228.eurprd07.prod.outlook.com>
References: <DBXPR07MB23993DC9B9946851B629E21F97C0@DBXPR07MB239.eurprd07.prod.outlook.com>
	<CABcZANniNW9XRsATUvu=D0nSMWh2paEWPED2xZRjo2z6VBKvBg@mail.gmail.com>
	<AM3PR07MB22889D01AF1F38A1664FBB3F97D0@AM3PR07MB228.eurprd07.prod.outlook.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: How to force BitBake to track dependency to METADATA_REVISION?
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
X-List-Received-Date: Fri, 06 May 2016 10:49:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-05-06 at 10:10 +0000, Kucharczyk, Bartlomiej (Nokia -
PL/Wroclaw) wrote:
> > Bitbake tracks unexpanded forms of variables, not expanded. So it's
> > literally storing '${@base_detect_revision(d)}" in the checksum,
> > not the actual revision.
> > METADATA_REVISION[vardepvalue] = "${METADATA_REVISION}" in your
> > recipe will do it.
> 
> Hello! 
> 
> Thanks for your answer. I've tried to use vardepvalue, but it does
> not work... After I build it for the second time (after bumping git
> revision), nothing is rebuilt.
> 
>     $ bitbake test
>     ...
>     NOTE: Tasks Summary: Attempted 251 tasks of which 0 didn't need
> to be rerun and all succeeded.
>     ...
>     $ echo "" >> ../README
>     $ git commit -m"test" ../README
>     $ bitbake test
>     ...
>     NOTE: Tasks Summary: Attempted 251 tasks of which 251 didn't need
> to be rerun and all succeeded.
>     ...
> 
> My test recipe is:
> 
>     $ cat ../meta/recipes-devtools/test/test_1.0.bb
>     LICENSE = "CLOSED"
>     INHIBIT_DEFAULT_DEPS = "1"
>     METADATA_REVISION[vardepvalue] = "${METADATA_REVISION}"
>     do_compile(){
>         echo "${METADATA_REVISION}" > "${S}/testfile"
>     }
> 
> Any suggestions?

The problem is probably the cache. It has no knowledge of when it needs
to reparse to see if this value has changed. If you set BB_DONT_CACHE =
"1" in the recipe, does that help?

Cheers,

Richard



