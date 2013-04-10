Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1UPvKE-0005ub-Rd
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 15:44:35 +0200
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 10 Apr 2013 15:27:11 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 84AC72837E9;
	Wed, 10 Apr 2013 15:27:11 +0200 (CEST)
Date: Wed, 10 Apr 2013 15:27:11 +0200
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130410132711.GI24646@sestofb10.enea.se>
References: <51650A7F.2020904@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <51650A7F.2020904@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: ptest results
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2013 13:44:37 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote:
> I ran ptest-runner finally I saw that there were failures, I am
> wondering if these are expected?
>
> http://pastebin.com/PAH3gJT0

Thank you for testing. Some test failures are to be expected. The purpose o=
f ptest is to make the tests build and run. Fixing errors found by the test=
s is a separate job.

That said, it is not always immediately obvious which errors are due to rec=
ipe/framework malfunction and which are actual test failures. You paste con=
tains some errors that are clearly recipe/framework issues:

- bash-ptest appears not have installed itself correctly. It looks like the=
 do_install_ptest() action has not been run. I fail to repeat this. Are you=
 seeing any errors in tmp/work/x86_64-poky-linux/bash/4.2-r6/temp/log.do_in=
stall_ptest_base?

- dbus-ptest-ptest has a similar issue. Its do_install_ptest contains a sed=
 expression to remove the dependencies that cause the error you get. Again =
it appears the action has not been run for some reason. I can't repeat this=
 either.

- Some test cases in dbus-ptest-ptest require /bin/sed, which your image do=
esn't have installed. The first-glance fix is to add sed as a runtime depen=
dency, but that doesn't work with images built with busybox. I'm not sure w=
hat the proper fix is here.

- The references to gcc in the output are due to libtool issues that I have=
 missed cleaning out. This is a bug in the dbus-ptest recipe.

- There is a path issue with some tests spawning binaries or opening files =
using the host build dir path, and obviously failing. This too is a recipe/=
testsuite bug.

> The bash packages did not seem to get split out correct, the ptest
> seem to land in ${PN} not in ${PN}-ptest, you might want to look
> into this also.

That would imply the PACKAGES prepend in ptest.bbclass isn't working. I can=
't repeat this on my end.

> With your patch, the ptest related debug files did go into the
> ${PN}-dbg, is this what you intend or should they go into a
> ${PN}-ptest-dbg package?

My intention, for now, is to put everything from /usr/lib/${PN}/ptest into =
${PN}-ptest. I'm not sure it is a good idea to split ptest packages into mu=
ltiple packages, because each such split risks catching some test data file=
 and move it into the wrong package. There is no rule or pattern to test da=
ta files.

--=20
Bj=F6rn


