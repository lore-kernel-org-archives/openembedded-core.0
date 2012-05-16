Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SUhif-0008Pq-LC
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 19:09:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4GGwwjg018193
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 09:58:59 -0700 (PDT)
Received: from wrlaptop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 16 May 2012 09:58:58 -0700
Date: Wed, 16 May 2012 11:58:48 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120516115848.4348b984@wrlaptop>
In-Reply-To: <4FB32EA1.3060601@linux.intel.com>
References: <20120515140110.2ba5a1be@wrlaptop>
	<CAKSdS8K64oTpq4asBcL9k4BgCe6BOEAwX3exQyq4GoTHtAxW9w@mail.gmail.com>
	<4FB32EA1.3060601@linux.intel.com>
X-Mailer: Claws Mail 3.7.8 (GTK+ 2.24.4; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: RFC: FOO_subtract, the logical antidote to FOO_append.
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
X-List-Received-Date: Wed, 16 May 2012 17:09:02 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Wed, 16 May 2012 07:35:45 +0300
Saul Wold <sgw@linux.intel.com> wrote:

> My understanding is that a _subtract is fraught with danger, there
> all sorts of ordering implications.

Yes.

But consider, if you will, the specific case of
DISTRO_FEATURES_LIBC_DEFAULT, and a libc which is just like eglibc
except that it lacks RPC.

Anything I do that isn't processed at the tail end of everything,
around the point where _appends are processed, will be unable to
cleanly obtain "the value that would have been set by default if
nothing else happened", and then remove a word from it.  I can't set a
value in advance, because if I do the ?= won't fire and none of those
words will get set.  I can't necessarily set a value later.

Overrides won't work either, because overrides also destroy the
existing values.

It seems to me that for a subtraction to work, it *must* be the very
last thing done.

Basically, the purpose of suggesting this as a formal behavior defined
to be The Very Last Thing is to minimize the complexity of the ordering
implications.  You get exactly what you would have gotten otherwise,
with these words removed.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


