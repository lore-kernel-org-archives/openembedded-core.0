Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Rdef2-00083S-8k
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 10:10:00 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RdeYC-00062N-H4
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 10:02:56 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <d4299e7c7d0c584cc0b1a0663111a9b328a73266.1324540323.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
	<d4299e7c7d0c584cc0b1a0663111a9b328a73266.1324540323.git.sgw@linux.intel.com>
Date: Thu, 22 Dec 2011 09:02:24 +0000
Message-ID: <1324544544.4492.16.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [CONSOLIDATED PULL 19/26] insane.bbclass: add QA tests for unsafe references to exec_prefix
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
X-List-Received-Date: Thu, 22 Dec 2011 09:10:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-21 at 23:55 -0800, Saul Wold wrote:
> +		exec_prefix = d.getVar('exec_prefix', True)
> +		sysroot_path = d.getVar('STAGING_DIR_TARGET', True)
> +		sysroot_path_usr = sysroot_path + exec_prefix
> +
> +		try:
> +			ldd_output = sub.check_output(["prelink-rtld", "--root", sysroot_path, path])
> +		except sub.CalledProcessError as e:
> +			if e.returncode != 127:
> +				error_msg = pn + ": prelink-rtld aborted when processing %s" % path
> +				package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
> +				return False
> +			else:
> +				# Sometimes this is done deliberately (e.g, e2fsprogs), so only warn
> +				bb.warn("%s has missing library dependencies" % path)
> +				return
> +		if sysroot_path_usr in ldd_output:
> +			error_msg = pn + ": %s links to something under exec_prefix" % path
> +			package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
> +			error_msg = "ldd reports: %s" % ldd_output
> +			package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
> +			return False

Is that going to do the right thing if ${prefix} == ${exec_prefix}?
It's not obvious to me that it will handle that case correctly.

p.




