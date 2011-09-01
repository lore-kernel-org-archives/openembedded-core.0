Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qz8bz-0002bp-LL
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Sep 2011 16:51:23 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qz8XE-0006co-84
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Sep 2011 16:46:29 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Sep 2011 15:46:27 +0100
In-Reply-To: <7826575ce92090c4460c7d016e0b06441f84cff7.1306865217.git.scott.a.garman@intel.com>
References: <cover.1306865217.git.scott.a.garman@intel.com>
	<7826575ce92090c4460c7d016e0b06441f84cff7.1306865217.git.scott.a.garman@intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314888388.19905.187.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 2/7] shadow: add a -native recipe with customized utilities
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
X-List-Received-Date: Thu, 01 Sep 2011 14:51:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I just tried using useradd.bbclass for the first time (in an effort to
make dbus installable on a readonly-rootfs) and it doesn't seem to be
working very well for me.

The root of my problem seems to be the code below.  As far as I can
tell, what's happening is that process_root_flag() consumes all the
command line arguments to useradd, which means that the subsequent call
to getopt() in process_flags() just returns immediately because there is
nothing left for it to do.  The upshot of all this is that the switches
on the command line are simply ignored and useradd doesn't do what I
wanted.

Is anybody else using this code successfully in oe-core with a
nontrivial USERADD_PARAM?

p.

On Tue, 2011-05-31 at 12:53 -0700, Scott Garman wrote:
> + /*
> ++ * process_root_flag - chroot if given the --root option
> ++ *
> ++ * We do this outside of process_flags() because
> ++ * the is_shadow_pwd boolean needs to be set before
> ++ * process_flags(), and if we do need to chroot() we
> ++ * must do so before is_shadow_pwd gets set.
> ++ */
> ++static void process_root_flag (int argc, char **argv)
> ++{
> ++	/*
> ++	 * Parse the command line options.
> ++	 */
> ++	int flag;
> ++	int option_index = 0;
> ++	static struct option long_options[] = {
> ++		{"root", required_argument, NULL, 'Q'},
> ++		{NULL, 0, NULL, '\0'}
> ++	};
> ++
> ++	while ((flag = getopt_long (argc, argv, "a:A:d:gM:Q:rR", long_options, &option_index)) != -1) {
> ++		switch (flag) {
> ++		case 'Q':
> ++			if ('/' != optarg[0]) {
> ++				fprintf (stderr,
> ++				         _("%s: invalid chroot path '%s'\n"),
> ++				         Prog, optarg);
> ++				exit (E_BAD_ARG);
> ++			}
> ++			newroot = optarg;
> ++
> ++			if (access (newroot, F_OK) != 0) {
> ++				fprintf(stderr,
> ++				        _("%s: chroot directory %s does not exist\n"),
> ++				        Prog, newroot);
> ++				exit (E_BAD_ARG);
> ++			}
> ++			if ( chroot(newroot) != 0 ) {
> ++				fprintf(stderr,
> ++				        _("%s: unable to chroot to directory %s\n"),
> ++				        Prog, newroot);
> ++				exit (E_BAD_ARG);
> ++			}
> ++			break;
> ++		/* no-op on everything else - they will be hanled by process_flags() */
> ++		}
> ++	}
> ++}




