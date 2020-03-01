Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 971816055F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 21:58:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48VxxT38jlz4Y;
	Sun,  1 Mar 2020 22:58:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1583099933;
	bh=/QCM5TqfZuBiBm66F86XsRNjMtWp/SESAV6GO/D57SI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pQO6Th4iIqGo3SuGQfSGHAvqsLRk5Y2hdxfRic2qTM+FDvj831waQJ02Mc8F1O5AP
	4ELW1vhDR6VYfvauPGXM1c5cyWRFwt5AP/nxVd3bTI+OBXoOPR87OHqB+DOc5cRDje
	jMXyYe8UQ0jOaXr+CJoEZB+/vyVusVWji0LM7xuTUelQxGrDA9RuHrrtgUh2ztG9Uf
	iGRs4YFDKBsMgowaMbwZLFzfBHFjh7bZGXebU9eDJIq5893kzmpjdvCjV4KVdv5800
	Qzier8d5EGX8So6+ApZh2spc5nxmUF3Jgg8c2uf+e4AruE1WK7C0sVLlqUyx8Zf7xb
	1hLJtESxRQyYPpyyOGzPTxR+5rBRGV1KGhMhTdO6aUDO5UXTm26LCm///nj+EGvHB2
	Ghksmvl4JNw7zmoXS2k0J/UBDCWNx2Cc82sZmqKc6P69l62KFHSfWgcb1WlLCnSvAd
	V+vXtwTtQLnaE5J7g7zL3ZKtXM5+OHpiVblRetgGN/R2yKpHdPFsIsf/adona8QRjt
	wKPoNvcC5n++5p4pc93OjdRLwvdoaq22kGL/27qxIm1uy57UxOIFjSzvBbW+SlvhJB
	tG9wZ7D1supbCc6F0d7hhsddB2WDKEQaighUGH4EfqPv7b6z57HeYIi6UWi/zTR/Sc
	6+PTH3KkV/3fhTU3eyP7sww8=
Date: Sun, 1 Mar 2020 23:58:51 +0200
From: Adrian Bunk <bunk@stusta.de>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20200301215851.GA15475@localhost>
References: <alpine.LFD.2.21.2003011506510.93328@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2003011506510.93328@localhost.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: best practises: how to properly "steal" recipes from a newer layer?
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
X-List-Received-Date: Sun, 01 Mar 2020 21:58:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Mar 01, 2020 at 03:29:35PM -0500, Robert P. J. Day wrote:
>...
>   1) writing the recipe from scratch, compatible with morty, or
>   2) flat-out stealing that recipe from a *newer* layer, as long as
>      it was compatible (this was done frequently)
>...
>   if i just blindly copy the recipe file forward, i'm going to have to
> go through this all again at the next migration. is there a reasonable
> way to add recipes to my (thud-based) layer that clearly shows those
> recipes are being scarfed from a newer layer? and i don't mean
> mentioning that in the commit msg as that will still require perusing
> all those commit messages.
> 
>   is there a clean way to do this? it may sound trivial, but in this
> case, i'm looking at a couple hundred recipes that eventually show up
> in newer layers that i could steal, and i really want to hang onto
> that information for the next migration.
> 
>   thoughts?

My usual approach for 2) is to have a recipes-backport/ in the layer 
that contains all recipes taken from more recent layers - completely
new recipes, new versions of recipes, and sometimes just one specific
change backported into a .bbappend.

Example in a layer for warrior (dropping an unwanted patch):
$ cat recipes-backport/e2fsprogs/e2fsprogs_1.44.5.bbappend 
SRC_URI_remove = "file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch"
$

If you have many backported changes and migrations are often not to the
latest Yocto release, you could further split this into 
recipes-backport-from-warrior/ etc.

With an "upstream first" policy all upstreamable cases of 1) become
cases of 2). For the example above see [1].

> rday

cu
Adrian

[1] https://github.com/openembedded/openembedded-core/commit/f5edce401cfb31ebd0200adaba9a201caf7ea705

