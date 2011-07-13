Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QgwMy-0007L3-UG
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 12:08:40 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QgwJA-0004Qj-VA
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 12:04:45 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jul 2011 11:04:44 +0100
In-Reply-To: <4E1C7F36.1080501@windriver.com>
References: <1865303E0DED764181A9D882DEF65FB6A167F0C70B@shsmsx502.ccr.corp.intel.com>
	<4E095480.3070001@windriver.com><1309266943.20015.290.camel@rex>
	<4E09E8B7.1070901@windriver.com>
	<0C757E680E33864AB113392C7E83F910BE518E@GSX300A.mxchg.m.corp>
	<1865303E0DED764181A9D882DEF65FB6A200B1C937@shsmsx502.ccr.corp.intel.com>
	<CACzvQmYM-Tn0xWL9Hc3hyn8EEUeZjbkfTDOYskETJrq7=TB77A@mail.gmail.com>
	<0C757E680E33864AB113392C7E83F910BE5196@GSX300A.mxchg.m.corp>
	<4E1C7F36.1080501@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310551484.6337.240.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [Draft design][RFC] Running postinst at rootfs	generation time
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
X-List-Received-Date: Wed, 13 Jul 2011 10:08:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-12 at 12:07 -0500, Mark Hatle wrote:
> On 7/5/11 5:06 AM, Hauser, Wolfgang (external) wrote:
> > The problem with the alphabetic order of the postinst scripts we managed by renaming some of the packages to fit the needed order. An ugly solution, but in case of missing python skills, the easiest.
> 
> Ya, this one bothers me slightly... and I'm not really sure how to solve it...

I guess the obvious answer is just to capture the ordering of the
postinsts at the point where opkg-native tries to run them in offline
root mode.  That is, something like:

+	rm -f ${IMAGE_ROOTFS}${opkglibdir}/unconfigured
	runtime_script_required=0
	for i in ${IMAGE_ROOTFS}${opkglibdir}/info/*.preinst; do
		if [ -f $i ] && ! sh $i; then
		     	runtime_script_required=1
-			opkg-cl ${IPKG_ARGS} flag unpacked `basename $i .postinst`
+			pkg=`basename $i .postinst`
+			opkg-cl ${IPKG_ARGS} flag unpacked $pkg
+			echo $pkg >> ${IMAGE_ROOTFS}${opkglibdir}/unconfigured

[...]

	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
		if [ $runtime_script_required -eq 0 ]; then
			# All packages were successfully configured.
			# update-rc.d, base-passwd are no further use, remove them now
			opkg-cl ${IPKG_ARGS} --force-depends remove update-rc.d base-passwd || true

			# Also delete the status files
			rm -rf ${IMAGE_ROOTFS}${opkglibdir}
		fi
+	else
+		rm -f ${IMAGE_ROOTFS}${opkglibdir}/unconfigured
	fi

Or, well, you get the idea.

p.




