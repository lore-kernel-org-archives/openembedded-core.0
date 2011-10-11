Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDa9O-0002TS-Sb for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 13:05:36 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9BB6Tqa008361 for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 12:06:29 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zRF7HpZVPN8M
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 12:06:29 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9BB6QpZ008357
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 12:06:28 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 11 Oct 2011 11:59:45 +0100
In-Reply-To: <DDA1B8C5-0867-406F-BB88-0D33B7501900@dominion.thruhere.net>
References: <DDA1B8C5-0867-406F-BB88-0D33B7501900@dominion.thruhere.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318330793.23801.88.camel@ted>
Mime-Version: 1.0
Subject: Re: How to overlay files/fs-perms.txt?
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
X-List-Received-Date: Tue, 11 Oct 2011 11:05:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-10-11 at 12:42 +0200, Koen Kooi wrote:
> In angstrom we have base-files overlayed to clean out /var and files/fs-perms.txt is getting in the way of that:
> 
> koen@dominion:/OE/tentacle/sources/openembedded-core/meta$ grep localstate files/fs-perms.txt 
> ${localstatedir}/cache	link	volatile/cache
> ${localstatedir}/run	link	volatile/run
> ${localstatedir}/log	link	volatile/log
> ${localstatedir}/lock	link	volatile/lock
> ${localstatedir}/tmp	link	volatile/tmp
> 
> In angstrom those aren't symlinks anymore, but tmpfs bind mounts managed by systemd.
> 
> So, how doI overlay that file in this oe-core layer universe?

To quote package.bbclass:

	# Return a list of configuration files based on either the default
	# files/fs-perms.txt or the contents of FILESYSTEM_PERMS_TABLES
	# paths are resolved via BBPATH
	def get_fs_perms_list(d):
		str = ""
		fs_perms_tables = bb.data.getVar('FILESYSTEM_PERMS_TABLES', d, True)
		if not fs_perms_tables:
			fs_perms_tables = 'files/fs-perms.txt'
		for conf_file in fs_perms_tables.split():
			str += " %s" % bb.which(bb.data.getVar('BBPATH', d, True), conf_file)
		return str


so it looks for a "files/fs-perms.txt" in BBPATH...

Cheers,

Richard



