Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C0AD778DC3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 09:23:29 +0000 (UTC)
Received: from hex ([192.168.3.46]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w729NOTk023376
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 2 Aug 2018 10:23:26 +0100
Message-ID: <5e8c54728e6990907fa60f2454ab7961c7561a93.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Ocampo Coronado, Omar" <omar.ocampo.coronado@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <0D62475714C01347BCA118AE7A61400376B2C64D@FMSMSX109.amr.corp.intel.com>
References: <0D62475714C01347BCA118AE7A61400376B2C64D@FMSMSX109.amr.corp.intel.com>
Date: Thu, 02 Aug 2018 10:18:56 +0100
Mime-Version: 1.0
X-Mailer: Evolution 3.28.1-2 
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: Strip kernel modules and signatures
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
X-List-Received-Date: Thu, 02 Aug 2018 09:23:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-08-01 at 22:46 +0000, Ocampo Coronado, Omar wrote:
> Hello OE,
> 
> While attempting to sign our kernel modules (using the kernel
> configuration  CONFIG_MODULE_SIG) the drivers in our image did not
> have the signature, even the certificate was being loaded by the
> kernel or the driver being signed during do_install().
> 
> Turns out package.bbclass, while it ignores to create debug info
> files it does strips the kernel modules files:
> 
> python split_and_strip_files () {
> 	...
> 	...
> 	        for f in kernmods:
>                           sfiles.append((f, 16, strip))
> 
>         oe.utils.multiprocess_exec(sfiles, oe.package.runstrip)
>     #
>     # End of strip
>     #
>     os.chdir(oldcwd)
> }
> 
> The strip is required for many reasons yet it removes the signature
> which we want to preserve in this scenario.
> To work around this issue add
>      INHIBIT_PACKAGE_STRIP = "1"
>      either on your virtual/kernel bb file or driver bb file.
> 
> Hope this helps someone in the future when adding signature to files,
> perhaps including this into the Yocto kernel development manual.

The code which handles kernel module stripping is in
meta/lib/oe/package.py:

stripcmd.extend(["--strip-debug", "--remove-section=.comment",
            "--remove-section=.note", "--preserve-dates"])

It would be good to see what we'd have to do to tweak that to work for
signed modules.

Cheers,

Richard

