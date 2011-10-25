Received: from dgate20.ts.fujitsu.com ([80.70.172.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rainer.Koenig@ts.fujitsu.com>) id 1RIciz-00087c-PQ
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Oct 2011 10:51:09 +0200
DomainKey-Signature: s=s1536a; d=ts.fujitsu.com; c=nofws; q=dns;
	h=X-SBRSScore:X-IronPort-AV:Received:X-IronPort-AV:
	Received:Message-ID:Date:From:User-Agent:MIME-Version:To:
	Subject:X-Enigmail-Version:Content-Type:
	Content-Transfer-Encoding;
	b=oJiJF/jVDLfzP5Kvk7V/YVoWcCkp+xPXSk5cNRBNMtEOWvGrW5x9gxPz
	bsOtJls9jGyP8C4y1GeUe8VFVTJFJzr20z55F3Ij0ZL/yo6DJnIB49ctd
	IGUCuF9Xg18imMfH1Y5qTDat7cDZVX7TmbTJiu/DmepqQwMraUL4aWP6K
	pLgZ1C2sM2WAJbMwFjn6nRMemOXG479ktLw4IUmPdW+8Okpen5M7zI6sp
	ga0B344HyUB809eNMpDzYHXsVc+Jw;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=ts.fujitsu.com; i=Rainer.Koenig@ts.fujitsu.com;
	q=dns/txt; s=s1536b; t=1319532314; x=1351068314;
	h=message-id:date:from:mime-version:to:subject:
	content-transfer-encoding;
	bh=ftfFS14ldBC0ZFoHrM7aF/xRvFz50ET7RIDp/ogCMgw=;
	b=WIZd6sYXUd5hX+dlzcyyq4IfV5WdCf4PlU27Ut/XF/MocGoaiP1V36pB
	aY6bcETrTLyUmyb16sE9MtSMktUU4ZxcsWiPLVVgPn3sKSzVKB+mSb7ZZ
	RZJC77FENAbP9sGnWT/BTvHEcyckSzJVbOLR5EMwl/7z5YXJHDOfRFJOn
	Tg9XM+yrud214Sw3QdO5zwfyhSpSh+BRcgZ8MpGcHsEGZ5s6A3Ef/NDSk
	EVUcyM/Gfym84upzjEl64tFLJhYcI;
X-SBRSScore: None
X-IronPort-AV: E=Sophos;i="4.69,402,1315173600"; d="scan'208";a="77469268"
Received: from abgdgate40u.abg.fsc.net ([172.25.138.90])
	by dgate20u.abg.fsc.net with ESMTP; 25 Oct 2011 10:44:09 +0200
X-IronPort-AV: E=Sophos;i="4.69,403,1315173600"; d="scan'208";a="122274704"
Received: from abg3595c.abg.fsc.net (HELO [172.25.145.158]) ([172.25.145.158])
	by abgdgate40u.abg.fsc.net with ESMTP; 25 Oct 2011 10:44:08 +0200
Message-ID: <4EA676D8.30206@ts.fujitsu.com>
Date: Tue, 25 Oct 2011 10:44:08 +0200
From: Rainer Koenig <Rainer.Koenig@ts.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111004 Icedove/3.0.11
MIME-Version: 1.0
To: Openembedded Core <openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.0.1
Subject: OE core behind a company firewall
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
X-List-Received-Date: Tue, 25 Oct 2011 08:51:09 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit

Hi,

I just tried out OE core according to the instructions at

http://www.angstrom-distribution.org/building-angstrom and

http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/tree/README

At home this works fine, but being inside my company's firewall during
the day I have some comments on the oebb.sh script.

First I didn't get that corkscrew stuff for git working. Don't know
whats wrong but since I had a working git-proxy setting for my SOCKS
server I modified the script so that it works for me.

###############################################################################
# CONFIG_GIT_PROXY() - Configure GIT proxy information
###############################################################################
function config_git_proxy()
{
    if [ ! -f ${GIT_CONFIG_DIR}/git-proxy.sh ]
    then
        mkdir -p ${GIT_CONFIG_DIR}
       cat > ${GIT_CONFIG_DIR}/git-proxy.sh <<_EOF
#!/bin/sh
/usr/bin/env /usr/bin/connect -S ${PROXYHOST}:1080 \$*
_EOF
        chmod +x ${GIT_CONFIG_DIR}/git-proxy.sh
        export GIT_PROXY_COMMAND=${GIT_CONFIG_DIR}/git-proxy.sh
    fi
}

Luckily http_proxy and SOCKS share the same server, so I could use
${PROXYHOST} here. :-)

With this setup I got oebb.sh working for me. But then I ran into
problems with building gcc-core-initial and I first thought its because
the SRC_URI is "svn://" but that was a wrong guess. Problem was that the
download was interrupted somehow and so unpacking the tgz failed.

Anyway, thinking of svn:-URIs I wonder about what will happen when
I need to access a SVN repo with the svn protocol. SVN seems to be a
pain in the ass when trying to use a SOCKS server. Well, actually there
is no need, because its just 3 recipes that I found which will use the
svn-protocol and its not likely that I need them for my project.

$ find -name "*.bb" | xargs grep "svn://" | grep -v proto
./sources/openembedded-core/meta/recipes-sato/puzzles/puzzles_r9306.bb:#SRC_URI
= "svn://ixion.tartarus.org/main;module=puzzles;rev=${MOD_PV}"
./sources/meta-smartphone/meta-shr/recipes-shr/3rdparty/openmoko-gps_svn.bb:SRC_URI
= "svn://forge.bearstech.com/forge/openmoko;module=gps"
./sources/meta-smartphone/meta-shr/recipes-shr/3rdparty/om-neon_svn.bb:SRC_URI
= "svn://svn.projects.openmoko.org/svnroot/neon;module=trunk"
./sources/meta-smartphone/meta-shr/recipes-shr/3rdparty/spojegui_svn.bb:SRC_URI
= "svn://xeres.cz/spoje/trunk;module=build"

Regards
Rainer
-- 
Dipl.-Inf. (FH) Rainer Koenig
Project Manager Linux Clients
Dept. PDG WPS R&D SW OSE

Fujitsu Technology Solutions
Bürgermeister-Ullrich-Str. 100
86199 Augsburg
Germany

Telephone: +49-821-804-3321
Telefax:   +49-821-804-2131
Mail:      mailto:Rainer.Koenig@ts.fujitsu.com

Internet         ts.fujtsu.com
Company Details  ts.fujitsu.com/imprint.html


