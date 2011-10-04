Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RB2jh-0001Z6-1a for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 13:00:37 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94B1RW5028625 for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 12:01:28 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UZdrDMM5UcQd
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 12:01:27 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94B1O5S028620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 12:01:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 04 Oct 2011 11:54:54 +0100
In-Reply-To: <1317660469.13337.16.camel@phil-desktop>
References: <1317660469.13337.16.camel@phil-desktop>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317725702.14671.33.camel@ted>
Mime-Version: 1.0
Subject: Re: sstate_clean() overzealous?
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
X-List-Received-Date: Tue, 04 Oct 2011 11:00:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-03 at 17:47 +0100, Phil Blundell wrote:
> The sstate_clean() function in sstate.bbclass is doing (inter alia):
> 
>     stfile = d.getVar("STAMP", True) + ".do_" + ss['task']
>     [...]
>     oe.path.remove(stfile + ".*")
>     oe.path.remove(stfile + "_setscene" + ".*")
> 
> which means that, for tasks which set the stamp-extra-info flag to
> ${MACHINE}, it ends up blowing away the stamps for all machines rather
> than just the current one.  The net effect of this seems to be that
> there is no way to have the setscene stamps populated for more than one
> MACHINE at any time, and hence all those tasks get rerun every time you
> change MACHINE even if nothing else has been altered.
> 
> Is this behaviour deliberate? 

No, its not intended to be wiping out all the different machines.

>  It is certainly a little bit annoying but
> I don't understand the internals of sstate well enough to judge what
> exactly that glob is trying to accomplish.

The trouble is we now support a variety of different stamp file formats
depending on what settings you have enabled (and metadata you're using).

Clean can be called from two sources, do_clean, or just before a sstate
controlled task is about to be run. In either case we want to clear out
any previous "state" including any stamp files that might have
represented this task since we're about to invalidate anything they did.
This means wiping out "normal" stamps and any setscene variants of those
stamps. We also want to remove any stamps representing other hashes for
this task since there is no version installed.

If the BasicHash signature generator code is enabled this adds hashes to
the stamp files. This turns the stamps into the form:

<stampfile>.<hash>
or in the case of machine specific tasks:
<stampfile>.<hash>.<machine>

I think we need to teach this clean function about stamp-extra-info and
instead of stfile + ".*", remove stfile + ".*." + stamp-extra-info if
stamp-extra-info is set. That would likely fix the problem you're
seeing.

Cheers,

Richard



