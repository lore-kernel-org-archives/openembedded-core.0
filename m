Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PvVb5-0004DH-Cp for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 15:03:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p24E1gZS032763
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Mar 2011 14:01:42 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32673-02 for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2011 14:01:38 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p24E1YZk032757
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Mar 2011 14:01:36 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1299235247-5527-1-git-send-email-Martin.Jansa@gmail.com>
References: <1299235247-5527-1-git-send-email-Martin.Jansa@gmail.com>
Date: Fri, 04 Mar 2011 14:01:26 +0000
Message-ID: <1299247286.17567.1349.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] bitbake.conf: point PERSISTENT_DIR outside TMPDIR
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
X-List-Received-Date: Fri, 04 Mar 2011 14:03:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-03-04 at 11:40 +0100, Martin Jansa wrote:
> * sanity check warning user that he still has peristent cache in old location
> * similar patch was sent to OE, to keep PERSISTENT_DIR location consistent
>   http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-March/030623.html
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/sanity.bbclass |    8 ++++++++
>  meta/conf/bitbake.conf      |    2 +-
>  meta/conf/sanity.conf       |    1 +
>  3 files changed, 10 insertions(+), 1 deletions(-)

When I saw this on the OE list, I'd assumed you'd done what Poky had
done, I've just realised you're moving this file to TOPDIR instead of
TMPDIR.

My big concern here is that we really shouldn't be writing to data to
the conf directory as its not what the user expects.

I say this knowing the raft of usability problems we've had every time
we take something outside of TMPDIR as users have the expectation that
deleting tmp wipes out all stored state and rebuilds. Having this file
hidden in the conf directory breaks that expectation. Note there are
only two things we place outside of TMPDIR, downloads and sstate data.
Even things like buildstats which you might want to preserve over
different builds are still inside TMPDIR.

Can we put it in cache as a top level file rather than machine specific?

Cheers,

Richard


> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 64af555..9a0dfcc 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -302,6 +302,14 @@ def check_sanity(e):
>      elif oeroot.find (' ') != -1:
>          messages = messages + "Error, you have a space in your POKYBASE directory path. Please move Poky to a directory which doesn't include a space."
>  
> +    #
> +    # Check there isn't old persistent cache
> +    #
> +    persistent_dir = data.getVar('PERSISTENT_DIR', e.data, True)
> +    persistent_cache_filename = data.getVar('SANITY_PERSIST_DATA_FILE', e.data, True)
> +    if os.path.exists(tmpdir + '/cache/' + persistent_cache_filename):
> +        messages = messages + "Error, persistent cache file '%s' exists in old location '%s', please migrate it to new location '%s' and merge them together if you have one for each MACHINE.\n" % (persistent_cache_filename, tmpdir + '/cache/', persistent_dir)
> +
>      if messages != "":
>          raise_sanity_error(messages)
>  
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 55db1ab..1fdd4c5 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -270,7 +270,7 @@ FILESDIR = "${@bb.which(bb.data.getVar('FILESPATH', d, 1), '.')}"
>  TMPDIR ?= "${TOPDIR}/tmp"
>  CACHE = "${TMPDIR}/cache${@['', '/' + str(bb.data.getVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d, 1))]}${@['', '/' + str(bb.data.getVar('SDKMACHINE', d, 1))][bool(bb.data.getVar('SDKMACHINE', d, 1))]}"
>  # The persistent cache should be shared by all builds
> -PERSISTENT_DIR = "${TMPDIR}/cache"
> +PERSISTENT_DIR = "${TOPDIR}/conf/persistent"
>  LOG_DIR = "${TMPDIR}/log"
>  CO_DIR = "${DL_DIR}"
>  CVSDIR = "${CO_DIR}/cvs"
> diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
> index fcaed11..46b542d 100644
> --- a/meta/conf/sanity.conf
> +++ b/meta/conf/sanity.conf
> @@ -6,6 +6,7 @@
>  BB_MIN_VERSION = "1.8.10"
>  
>  SANITY_ABIFILE = "${TMPDIR}/abi_version"
> +SANITY_PERSIST_DATA_FILE = "bb_persist_data.sqlite3"
>  
>  SANITY_VERSION = "1"
>  POKY_CONF_VERSION  = "1"




