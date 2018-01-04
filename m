Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2D2B1600E3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 22:00:52 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w04M0o7H016171
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 4 Jan 2018 22:00:51 GMT
Message-ID: <1515103250.30291.7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 04 Jan 2018 22:00:50 +0000
In-Reply-To: <1515096936.665.19.camel@gmail.com>
References: <1515096936.665.19.camel@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: Uninative and sstate
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
X-List-Received-Date: Thu, 04 Jan 2018 22:00:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-01-04 at 14:15 -0600, Joshua Watt wrote:
> We've run into a strange issued that turned out to be cased by
> missing
> iconv conversion libraries in our uninative tarball, but is sparked a
> larger question that I was hoping someone here could answer.
> 
> The problem was particularly baffling. We were attempting to use
> Doxygen in a recipe which required some missing iconv conversion
> files.
> If we built doxygen locally, it worked just fine, but if we choose to
> allow bitbake to pull doxygen down from a sstate it would fail. Even
> more baffling, if we manually extracted the sstate
> do_populate_sysroot
> tarball for doxygen and used the executable there, everything worked.
> We surmised that bitbake was modifying the the doxygen executable
> after
> it extracted from the sstate tarball, which was confirmed by
> comparing
> checksums. After some digging, the cause of the change was tracked
> down
> to uninative_changeinterp() running after the sstate tarball was
> extracted, changing the program interpreter to the one in the
> uninative
> tarball.
> 
> My question is: Why is this coercion of the program interpreter
> *only*
> done when the sysroot is populate from sstate? For consistency, it
> would seem appropriate to also coerce the interpreter when doing
> do_populate_sysroot from an actual build. If this had been done, we
> would have noticed the missing library when building locally, and the
> sstate cache would not have caused "random" build breakage.
> 
> Does anyone have any insight as to why this isn't done?

Which release are you using?

There used to be an optimisation we made where we only did it when we
needed to (using sstate). The move to RSS meant that we now always have
to do it. I'd therefore guess you're using morty or older? On more
recent versions you'll see it always relocating. There are pros and
cons both ways.

Cheers,

Richard

