Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CD84C6FFC7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 20:53:32 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 13 Mar 2016 13:53:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,333,1455004800"; d="scan'208";a="65548374"
Received: from jschew-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.169.99])
	by fmsmga004.fm.intel.com with ESMTP; 13 Mar 2016 13:53:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 14 Mar 2016 09:53:29 +1300
Message-ID: <1773609.Q7X4j5YgZm@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.3-300.fc23.x86_64; KDE/4.14.17; x86_64; ;
	)
In-Reply-To: <56E5D0C1.7010302@gmail.com>
References: <1457836529-32388-1-git-send-email-twoerner@gmail.com>
	<10341857.OKlmJH1THC@peggleto-mobl.ger.corp.intel.com>
	<56E5D0C1.7010302@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] metadata-revs: provide more information
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
X-List-Received-Date: Sun, 13 Mar 2016 20:53:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sun, 13 Mar 2016 16:42:41 Trevor Woerner wrote:
> On 03/13/16 15:26, Paul Eggleton wrote:
> > On Sat, 12 Mar 2016 21:35:29 Trevor Woerner wrote:
> >> Provide many more details concerning the repositories that are used in a
> >> particular build: the remote information, the layer, the local branch,
> >> the
> >> remote branch the local branch tracks (if any), and the HEAD commit.
> >> 
> >> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> >> ---
> >> 
> >>   meta/classes/buildhistory.bbclass |  6 +++++-
> >>   meta/classes/metadata_scm.bbclass | 18 ++++++++++++++++++
> >>   2 files changed, 23 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/meta/classes/buildhistory.bbclass
> >> b/meta/classes/buildhistory.bbclass index b6b4324..1b0ae0e 100644
> >> --- a/meta/classes/buildhistory.bbclass
> >> +++ b/meta/classes/buildhistory.bbclass
> >> 
> >> @@ -615,9 +615,13 @@ def buildhistory_get_build_id(d):
> >>   def buildhistory_get_metadata_revs(d):
> >>       # We want an easily machine-readable format here, so
> >> 
> >> get_layers_branch_rev isn't quite what we want +    import subprocess
> >> 
> >>       layers = (d.getVar("BBLAYERS", True) or "").split()
> >> 
> >> -    medadata_revs = ["%-17s = %s:%s" % (os.path.relpath(i,
> >> d.getVar('BBLAYERS_FETCH_DIR', True)), \ +    medadata_revs =
> >> ["%s\tlayer:
> >> %s\n\tbranch: %s\n\tremote: %s\n\tHEAD:   %s\n" % ( \ +
> >> base_get_metadata_git_remote(i, None), \
> >> +        os.path.relpath(i, d.getVar('BBLAYERS_FETCH_DIR', True)), \
> >> 
> >>           base_get_metadata_git_branch(i, None).strip(), \
> >> 
> >> +        base_get_metadata_git_remote_branch(i, None).strip(), \
> >> 
> >>           base_get_metadata_git_revision(i, None)) \
> >>           
> >>               for i in layers]
> >>       
> >>       return '\n'.join(medadata_revs)
> >> 
> >> diff --git a/meta/classes/metadata_scm.bbclass
> >> b/meta/classes/metadata_scm.bbclass index 0f7f423..31a2c54 100644
> >> --- a/meta/classes/metadata_scm.bbclass
> >> +++ b/meta/classes/metadata_scm.bbclass
> >> 
> >> @@ -73,6 +73,15 @@ def base_get_metadata_git_branch(path, d):
> >>           rev = '<unknown>'
> >>       
> >>       return rev.strip()
> >> 
> >> +def base_get_metadata_git_remote_branch(path, d):
> >> +    import bb.process
> >> +
> >> +    try:
> >> +        rev, _ = bb.process.run('git rev-parse --abbrev-ref
> >> --symbolic-full-name @{u}', cwd=path) +    except
> >> bb.process.ExecutionError:
> >> +        rev = '(HEAD does not point to a remote branch)'
> >> +    return rev.strip()
> >> +
> >> 
> >>   def base_get_metadata_git_revision(path, d):
> >>       import bb.process
> >> 
> >> @@ -81,3 +90,12 @@ def base_get_metadata_git_revision(path, d):
> >>       except bb.process.ExecutionError:
> >>           rev = '<unknown>'
> >>       
> >>       return rev.strip()
> >> 
> >> +
> >> +def base_get_metadata_git_remote(path, d):
> >> +    import bb.process
> >> +
> >> +    try:
> >> +        lines, _ = bb.process.run('git remote -v', cwd=path)
> >> +    except bb.process.ExecutionError:
> >> +        return '<unknown>'
> >> +    return lines
> > 
> > As I mentioned in my other reply, metadata-revs was intended to be
> > consumed by scripts rather than humans, so I'd rather not change its
> > format unless absolutely necessary.
> 
> No problem, I had guessed that might be the case.
> 
> Would you (or anyone) be open to the possibility of the buildhistory
> task creating a second file that would contain this information?
> 
> I had been thinking about doing something like this for a long time.
> Having the two "meta" listings is what finally prompted me to actually
> do something about it. The fact that Ross pointed out that it was really
> the result of my own mistake is a little bit secondary to what I'm
> trying to accomplish.
> 
> I like to keep my build artifacts for a very long time. But I find when
> I'm looking through my old artifacts that I wish I had also kept the
> various configurations that led to that artifact's creation. ["Wait... I
> successfully built something for MACHINE XYZ back in June, how did I do
> that?"] So along with the artifacts I've also been keeping local.conf,
> auto.conf, bblayers.conf... and metadata-revs.

I'm not dead-set against it; I'm not madly keen on adding more noise to 
changelogs, but then they probably need to be looked at through buildhistory-
diff rather than git diff at the moment anyway.

> However, as I've pointed out, there are lots of clones around. Have you
> taken a look at github recently? There are dozens of clones + tweaks to
> many of the repositories we all know and love: beaglebone, odroid,
> raspberrypi, browser. Sometimes it's one of these clones that works out
> better for a given situation (MACHINE, board...) than the canonical. For
> example, if I want to add chromium to my DragonBoard410c build, I need
> to use Linaro's clone of meta-browser and not the canonical OSSystems' one.

Surely we really ought to be addressing that then? If this is coming up more 
and more we need to find a systematic approach to resolving the problem. The 
more we let this continue the harder it will be for people who don't have the 
knowledge or persistence to resolve these issues by swapping in forks to do 
so; they'll simply give up. The question is what can we do to address the 
issues in the canonical layers rather than people having to resort to using 
forks? Are you able to give some examples?

> The information currently provided by buildhistory/metadata-revs doesn't
> provide the level of detail required to distinguish between these two
> situations. In six months I would look at what I've built today, grab
> git://github.com/OSSystems/meta-browser.git, and then say: "how come
> there's no commit 5c00d0114c5963a178cb33f6d06181c588c03ae0?". It's not
> like there's any requirement to make the names of all layers universally
> unique.
> 
> That's the problem I'm trying to solve: how can I easily keep all the
> information required to reproduce this build, exactly. The whole "two
> meta's" thing was just a speed bump.

Right, understood, and it does make sense. I'm convinced there is an 
underlying problem to fix that this just papers over though.

This probably fits with what you said at OEDEM, which was that too often the 
system doesn't build properly out of the box for various boards. Have you had 
a chance to think about that problem further?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

