Return-Path: <jori@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 2242B60DFA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 07:29:04 +0000 (UTC)
Received: from sestows930 (172.16.140.39) by smtp.enea.com (172.21.1.208) with
	Microsoft SMTP Server id 14.3.158.1; Wed, 26 Mar 2014 08:29:00 +0100
Received: by sestows930 (Postfix, from userid 1000)	id 3224B1801E1; Wed, 26
	Mar 2014 08:29:00 +0100 (CET)
Date: Wed, 26 Mar 2014 08:29:00 +0100
From: Jonas Eriksson <jonas.eriksson@enea.com>
To: Andrea Adami <andrea.adami@gmail.com>
Message-ID: <20140326072900.GF5752@enea.com>
References: <1395676565-14427-1-git-send-email-jonas.eriksson@enea.com>
	<1395676565-14427-2-git-send-email-jonas.eriksson@enea.com>
	<CAAQYJAvbzVjJkKQ+xZkwMBXtvWQZR-XYnG1Fn56Euj-Dih8_Ow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAvbzVjJkKQ+xZkwMBXtvWQZR-XYnG1Fn56Euj-Dih8_Ow@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: jonas.eriksson@enea.com does not
	designate permitted sender hosts)
Cc: Josep Puigdemont <josep.puigdemont@enea.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cpio rootfs build: Avoid modifying rootfs dir
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
X-List-Received-Date: Wed, 26 Mar 2014 07:29:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Andrea,

On Wed, Mar 26, 2014 at 00:04:55 +0100 Andrea Adami wrote:
> I admit I did not encounter this race, still I tested the patch
> because it caught my attention.
> 
> There are some rare cases where init is a symlink pointing to a custom
> executable so the previous test was specifically done in order to
> avoid to touch a symlink.

Yes, that makes sense. It's however a bit problematic to alter
the rootfs directory after the do_rootfs has finished executing.
This is why the ./init append was moved to work with a separate
directory.

To clarify around the symlink situation: The patch moves from a
-L to a -e to make sure that we don't append the ./init to the
cpio if there is any kind of ./init in the rootfs directory, be
it a file or a symlink.

> I was initially afraid of the change but actually the test is done
> after the creation of the cpio so this patch doesn't seem to break our
> special case.
> 
> Acked-by: Andrea Adami <andrea.adami@gmail.com>

Thanks for the feedback and Ack!

/Jonas

