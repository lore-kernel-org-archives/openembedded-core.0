Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1TQLrb-0004Q2-Er
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 19:32:31 +0200
Received: from [192.168.0.2] (host81-153-114-123.range81-153.btcentralplus.com
	[81.153.114.123]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 8F9DB99A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 18:19:07 +0100 (BST)
Message-ID: <5085800A.4060600@r-finger.com>
Date: Mon, 22 Oct 2012 18:19:06 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
In-Reply-To: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
Subject: Re: [RFC] OpenGL packaging/staging policy
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
X-List-Received-Date: Mon, 22 Oct 2012 17:32:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ross,

On 22/10/12 17:35, Burton, Ross wrote:
> Rule 3. Only Mesa stages, nothing else

I think it is a big mistake to special case mesa as anything other than
*a* GL provider. GL stacks provide their own headers, these headers
might not be identical to the mesa headers, and people writing GL
software for the particular target have every right to expect to be
using the headers provided with their GL stack -- sooner or later this
rule will have to be broken because of customer software  not buildable
under Yocto. (Whether the headers should be identical is neither here
nor there; Yocto needs to work in the real world, and you well know that
in the real world this is not the case.)

I know some folk don't like to hear this, but whether you like it or
not, GL libs are tied to specific HW, i.e., are machine-specific. Our
current difficulties stem directly from trying to pretend this is not
the case, or that mesa is somehow more than just *a* GL provider. IMHO
the correct thing to do here is:

a) Make the mesa packages machine specific so we can control compatible
machines and preferred providers to match the HW realities,

b) Split the ginormous mesa recipe, so that it is, for example, possible
to stage mesa gl without mesa egl, so that we can accommodate HW that
wants to use bits of mesa.

Tomas



