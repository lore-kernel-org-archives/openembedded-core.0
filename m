Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1TQlgs-00015d-7B
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 23:07:10 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9NKrhZB028030
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Oct 2012 13:53:43 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 23 Oct 2012 13:53:42 -0700
Date: Tue, 23 Oct 2012 15:53:25 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20121023155325.73a904ac@e6410-2>
In-Reply-To: <508702EA.6090800@linux.intel.com>
References: <cover.1351024134.git.peter.seebach@windriver.com>
	<508702EA.6090800@linux.intel.com>
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.10; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Make n32 survive insane.bbclass and multilib_header
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
X-List-Received-Date: Tue, 23 Oct 2012 21:07:10 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Tue, 23 Oct 2012 13:49:46 -0700
Saul Wold <sgw@linux.intel.com> wrote:

> How can I build test this, the same way as x32?

I am ... not entirely sure how you'd do it in the absence of an
n32 target. Our binary prebuilt toolchain uses n32 for one of the
Octeon parts.

I think any tuning that uses n32 should illustrate the failure modes in
the previous setup, which are:

1. First thing you build that has target binaries errors out with QA
checks because you're making 32-bit binaries for mips64.
2. Anything that wants ncurses ends up thinking that ncurses.h doesn't
exist because ncurses.h is a symlink to curses.h, and curses.h is
renamed to curses-64.h, but the #include magic in the wrapper looks for
curses-n32.h.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


