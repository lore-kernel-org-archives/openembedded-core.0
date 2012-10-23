Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1TQmXb-00029l-TH
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 00:01:40 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9NLmBaT028880
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Oct 2012 14:48:12 -0700 (PDT)
Received: from e6410-2 (172.25.40.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 23 Oct 2012 14:48:11 -0700
Date: Tue, 23 Oct 2012 16:47:53 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20121023164753.0dcdcd17@e6410-2>
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
X-List-Received-Date: Tue, 23 Oct 2012 22:01:40 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Tue, 23 Oct 2012 13:49:46 -0700
Saul Wold <sgw@linux.intel.com> wrote:

> On 10/23/2012 01:32 PM, Peter Seebach wrote:
> > The multilib_header fixup has code in the generated header to handle
> > n32, but doesn't detect n32 headers. Meanwhile, insane.bclass
> > rejects n32 binaries for being 32-bit binaries in a mips64 build.
> > Solution: Use an ABI suffix, and check for it in appropriate places.
> >
> 
> How can I build test this, the same way as x32?

And to save you trouble, I don't know how it passed my first test build,
because it obviously fails now on glib. Solution seems to be:

+++ b/meta/classes/siteinfo.bbclass
@@ -50,6 +50,7 @@ def siteinfo_data(d):
         "linux": "common-linux common-glibc",
         "linux-gnu": "common-linux common-glibc",
         "linux-gnux32": "common-linux common-glibc",
+        "linux-gnun32": "common-linux common-glibc",

so I'll retest with that and resubmit.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


