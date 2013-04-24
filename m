Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UUvy4-00032Q-10 for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 11:26:25 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3O99iF2016642; Wed, 24 Apr 2013 10:09:44 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nVsUzpCd308b; Wed, 24 Apr 2013 10:09:43 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3O99bB8016634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 24 Apr 2013 10:09:38 +0100
Message-ID: <1366794506.23738.94.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 24 Apr 2013 10:08:26 +0100
In-Reply-To: <20130424084615.GG3217@jama>
References: <20130424084615.GG3217@jama>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Reexecuting do_fetch after do_unpack failed with reference is not a tree
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
X-List-Received-Date: Wed, 24 Apr 2013 09:26:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-04-24 at 10:46 +0200, Martin Jansa wrote:
> Hi,
> 
> I guess this will be hard to fix correctly, but please comment if I've
> overlooked something:
> 
> 1) update foo git repository with new commit ABCD, but forget to push it
> 2) bump SRCREV in foo.bb to ABCD
> 3) run bitbake foo, it will run do_fetch to catch new changes in remote
>    repo, but ABCD is not there, so do_unpack will fail like this:
> 
>    NOTE: Running task 2289 of 4227 (ID: 1185, foo.bb, do_unpack)
>    NOTE: recipe foo-1.0+gitr2+ABCD: task do_unpack: Started
>    ERROR: Function failed: Fetcher failure: Fetch command failed with exit code 128, output:
>    fatal: reference is not a tree: ABCD
> 
> 4) realize missing "git push" in step 1) and push it now
> 5) run bitbake foo again, but do_unpack is still failing, because
>    do_fetch checksums is the same (nothing changed in metadata) so stamp
>    is still valid.
> 
> 6) fix it with "bitbake -c fetch -f foo", but that could be complicated
>    if bump SRCREV was pushed already and possibly many builders already
>    executed do_fetch, so maybe push PR bump or something like that.
> 
> Only better solution than 6) I can think of, is to detect 
> "fatal: reference is not a tree" in do_unpack and if it's git repository
> then remove do_fetch stamp and hope it was fixed in remote git repo.

I'd say do_fetch should detect that the specified revision isn't present
and fail there and then in do_fetch.

Cheers,

Richard



