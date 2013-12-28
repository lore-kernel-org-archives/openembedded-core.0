Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EBCD26B5BC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:52:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Dec 2013 14:52:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="458861115"
Received: from unknown (HELO helios.localnet) ([10.252.122.113])
	by orsmga002.jf.intel.com with ESMTP; 28 Dec 2013 14:52:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Dec 2013 22:52:18 +0000
Message-ID: <5069586.lVvcYzeSdC@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1386375114-7702-1-git-send-email-raj.khem@gmail.com>
References: <1386375114-7702-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildhistory.bbclass: Specify lang in decoding strings
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
X-List-Received-Date: Sat, 28 Dec 2013 22:52:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 06 December 2013 16:11:54 Khem Raj wrote:
> On systems where default locale is utf-8 we get errors like
> 
> File: 'buildhistory.bbclass', lineno: 38, function: write_pkghistory
> 0034: if pkginfo.rconflicts:
> 0035: f.write("RCONFLICTS = %s\n" % pkginfo.rconflicts)
> 0036: f.write("PKGSIZE = %d\n" % pkginfo.size)
> 0037: f.write("FILES = %s\n" % pkginfo.files)
> *** 0038: f.write("FILELIST = %s\n" % pkginfo.filelist)
> 0039:
> 0040: for filevar in pkginfo.filevars:
> 0041: filevarpath = os.path.join(pkgpath, "latest.%s" % filevar)
> 0042: val = pkginfo.filevars[filevar]
> Exception: UnicodeEncodeError: 'ascii' codec can't encode character
> u'\xed' in position 337: ordinal not in range(128)
> 
> This patch specifies decode to use utf-8 so ascii and utf-8 based
> locales both work
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/buildhistory.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass index 1e6d968..4ff39a0 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -190,7 +190,7 @@ python buildhistory_emit_pkghistory() {
>                  key = item[0]
>                  if key.endswith('_' + pkg):
>                      key = key[:-len(pkg)-1]
> -                pkgdata[key] = item[1].decode('string_escape')
> +                pkgdata[key] = item[1].decode('utf-8', 'string_escape')
> 
>          pkge = pkgdata.get('PKGE', '0')
>          pkgv = pkgdata['PKGV']

Khem, did you test that this actually works? Here it does not - I get strings 
with \n \t in them; reverting this change makes it interpret these as it 
should.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

