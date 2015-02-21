Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2AD7F71637
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 12:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1LCYHeT029728; Sat, 21 Feb 2015 12:34:17 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 41uB5vpndeLe; Sat, 21 Feb 2015 12:34:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1LCY4p1029725
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 21 Feb 2015 12:34:16 GMT
Message-ID: <1424522044.11836.70.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sat, 21 Feb 2015 12:34:04 +0000
In-Reply-To: <alpine.LFD.2.11.1502210434001.12954@localhost>
References: <alpine.LFD.2.11.1502210434001.12954@localhost>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: questions about WORKDIR and S usage and files/ stuff
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
X-List-Received-Date: Sat, 21 Feb 2015 12:34:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2015-02-21 at 05:09 -0500, Robert P. J. Day wrote:
> which makes sense since gcc is a special case -- in short, for any
> kind of "normal" recipe, there is no compelling reason to ever mess
> with the WORKDIR variable, is there?

You'd probably break things if you did.

>   next, S, and its default value, again from bitbake.conf:
> 
>   S = "${WORKDIR}/${BP}"
> 
> as i read it (and i sure hope i understand this correctly), the S
> directory is where a recipe's source is going to be unloaded and
> patched, correct? and, AFAICT, setting this is a *choice* on the part
> of the recipe author. leaving that value as it is seems to be
> perfectly reasonable, or a recipe author can tweak it to some other
> moderately-related value. i've seen numerous examples where, if the
> SRC_URI refers to a git repo, the recipe author sets:
> 
>   S = "${WORKDIR}/git"
> 
> but, again, that's a *choice*, correct?

No, this is where the bitbake fetcher typically unpacks to. The git
fetcher module defaults to a directory called "git" in WORKDIR.

>  just because you're cloning
> from a git repo doesn't *require* you to set S that way, does it? is
> there any standard OE convention or, more importantly, *requirement*
> for the value of S depending on the recipe?

The S value is determined by the things in SRC_URI. A tarball usually
has the files in directory called ${BP} and when the fetcher extracts to
WORKDIR, the files end up in a directory called ${BP} as a result.

Not all tarballs follow that convention so the recipe sets this value as
appropriate.

>   moving on, when a recipe contains associated files in a files/ or
> ${PN}/ directory, as i read it, all of those files are always copied
> directly into ${WORKDIR} for further processing, correct? as in, it
> doesn't matter how you set S for that recipe, all files listed with
> "file://" in the recipe's SRC_URI will be copied directly to
> ${WORKDIR}, yes? and those files fall into two major categories.

*All* items in SRC_URI are unpacked to WORKDIR. Its just some create
subdirectories themselves (like tarballs or the git fetcher) since to do
otherwise would be more confusing.

If you change these values you will see things break.

>   if a file is a patch file (.diff,.patch suffix), it will be applied
> automatically. if it's not a patch file, then it only makes sense if
> the corresponding recipe manually and explicitly does something with
> that file, correct? otherwise, there's no point in it being there.

Correct.

>   consider the obvious recipe for base-files -- that contains a
> SRC_URI that reflects *nothing* but explicit files to populate the
> destination ${D} directory, and each one of those files *must* be
> manually installed in ${D} somewhere in the recipe, or there is no
> point in that file in even being there, correct? (i ask this painfully
> simple question because i *know* i've run across recipes that list a
> non-patch file in SRC_URI that the recipe subsequently does nothing
> with, and i always explain to students that that's a bit of an oddity
> and probably represents a historical holdover.)

Right, that is probably a mistake.

>   sticking with those non-patch files, it makes sense that all of them
> should be processed relative to their location in ${WORKDIR} (which is
> where they've all been copied), but occasionally, i'll see a recipe
> that sets:
> 
>   S = ${WORKDIR}
> 
> then refers to all those files relative to ${S}. sure, that'll work,
> but it always struck me as dangerous in case you ever need to use a
> separate S directory down the road, then you'd have to change the
> entire recipe.
> 
>   as an example, consider base-files again, which sets:
> 
>   S = "${WORKDIR}"
> 
> but not for any reason that i can see since that recipe consists of
> nothing but explicit files, and all of their processing is done with
> respect to ${WORKDIR}, anyway, which strikes me as the right way to do
> it. so, a question -- what is the point of the base-files recipe
> setting S to that value? doesn't seem to have any purpose that i can
> see.

See the recent patches which actually added that.

>   finally(?), i've seen a number of recipes that set:
> 
>   S = "${WORKDIR}"
> 
> even if they have a SRC_URI tarball *and* some accompanying files to
> process. i'm *assuming* this is acceptable as long as the recipe
> author knows that unloading both the tarball source and the files into
> the same WORKDIR won't cause any name clashes, yes? it would seem to
> always be cleaner to keep the source in a subdirectory, but if a
> recipe author wants to mix everything in the same place, i guess
> that's a possibility. is there any *compelling* reason to set S =
> ${WORKDIR}?

See the above recent patch series.

>   i think that's it for now ... i just wanted to make sure i
> completely understand this variable usage as the basis for the next
> posting or two.
> 
> rday
> 
> p.s. i also notice that a small number of OE recipes contain the
> apparently redundant setting:
> 
> $ grep -r "^S = \"\${WORKDIR}/\${BP}\"" *
> meta/recipes-extended/texinfo/texinfo_4.8.bb:S = "${WORKDIR}/${BP}"
> meta/recipes-extended/texinfo/texinfo_5.2.bb:S = "${WORKDIR}/${BP}"
> meta/recipes-support/taglib/taglib_1.9.1.bb:S = "${WORKDIR}/${BP}"
> $
> 
> which i would be tempted to remove, just because i'm a big fan of
> minimalization.

Those can likely be cleaned up, yes. Patches welcome.

Cheers,

Richard


