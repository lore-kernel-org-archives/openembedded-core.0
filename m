Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TCV8b-0004Se-M1
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 14:36:49 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q8ECOB9P029216
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 14 Sep 2012 14:24:12 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TCUwd-0007Ec-G1; Fri, 14 Sep 2012 14:24:27 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1347451098-16659-1-git-send-email-constantinx.musca@intel.com>
	<lyvcfgu9ls.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1347623450.9456.29.camel@ted>
Date: Fri, 14 Sep 2012 14:24:27 +0200
In-Reply-To: <1347623450.9456.29.camel@ted> (Richard Purdie's message of "Fri, 
	14 Sep 2012 12:50:50 +0100")
Message-ID: <lyobl8u70k.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.99
X-Spam-Score: -5.7
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Constantin Musca
	<constantinx.musca-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] patch.bbclass: Use one TMPDIR per patching process
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
X-List-Received-Date: Fri, 14 Sep 2012 12:36:49 -0000
Content-Type: text/plain

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>> > +    process_tmpdir = os.path.join('/tmp', str(os.getpid()))
>> > +        shutil.rmtree(process_tmpdir)

> Its only being used as a prefix, not as the full directory path name
> so it isn't quite as insecure as it would first appear.

It *is* insecure as it would first appear.  'shutil.rmtree()' does not
traverse the directory in a secure way so that an attacker could:

1. touch /tmp/<2-32767>/a
2. mkdir /tmp/<2-32767>/Z
3. wait for an inotify which triggers on deletion of the 'a' files
4. rmdir /tmp/$dir/Z
5. ln -s /home/<user> /tmp/$dir/Z

When steps 4+5 are executed between

| $ strace python -c 'import shutil; shutil.rmtree("/tmp/2");'
| ...
| lstat("/tmp/2/Z", {st_mode=S_IFDIR|0755, st_size=60, ...}) = 0
| <<<< steps 4+5 here >>>>
| openat(AT_FDCWD, "/tmp/2/Z", O_RDONLY|O_NONBLOCK|O_DIRECTORY|O_CLOEXEC) = 3
| getdents(3, /* 3 entries */, 32768)     = 72
| ...
| unlink("/tmp/2/Z/foo")                  = 0

user writable directories will be removed.

There have been established some rules regarding secure tmpfile/dir
generation in the last 10-20 years which should never be violated.


Beside the obvious security issues, build will be aborted when somebody
else creates a /tmp/<number> file and <number> matches the bitbake pid.


Enrico


