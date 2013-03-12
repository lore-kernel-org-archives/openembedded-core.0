Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1UFUr4-0006YE-Ba
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 20:27:37 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r2CJAcC2008319
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 12 Mar 2013 20:10:39 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1UFUas-0001gM-8c; Tue, 12 Mar 2013 20:10:38 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <7acaf76adbd1f0c29b17da721267392533d3a703.1360499939.git.enrico.scholz@sigma-chemnitz.de>
	<69be0b1aae50eb097172bcfa2e9aa02157f62436.1360499939.git.enrico.scholz@sigma-chemnitz.de>
	<1362570557.11727.59.camel@ted>
	<lya9q8ud8c.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1363114053.9859.15.camel@ted>
Date: Tue, 12 Mar 2013 20:10:38 +0100
In-Reply-To: <1363114053.9859.15.camel@ted> (Richard Purdie's message of "Tue, 
	12 Mar 2013 18:47:33 +0000")
Message-ID: <lyzjy8qvrl.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -6.7
X-Spam-Level: ------
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] package.bbclass: use oe.path.realpath()
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
X-List-Received-Date: Tue, 12 Mar 2013 19:27:43 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> > Have you any time to look into this performance regression?
>> 
>> Well, patch replaced a call to os.path.realpath() with a more accurate
>> variant honoring a sysroot. There must be more work be done to replace
>> things previously solved by the operating system with custom (python)
>> code.
>> 
>> I will try to write a C implementation of oe.path.realpath() but this
>> can take some time and I do not have an idea how to integrate it into
>> oe.
>
> The issue is not an interpreted language verses C, the problem is the
> shear number of syscalls. Each isdir() and islink() call means a stat
> call into the kernel.

With

    try:
-        is_dir = os.path.isdir(file)
+        if assume_dir:
+            is_dir = True
+        else:
+            is_dir = os.path.isdir(file)
    except:

in meta/lib/oe/path.py you should be able to reduce calls to isdir().

A

-                rtarget = oe.path.realpath(path, inst_root, True, assume_dir = True)
+                rtarget = oe.path.realpath(path, inst_root, False, assume_dir = True)

in package.bbclass seems to be save (pkgfiles[] is filled by os.walk() so
that locations should be already physical) and might improve performance
too.

But I do not have numbers how much you can save by these changes.


Enrico


