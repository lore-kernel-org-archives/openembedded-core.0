Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QRsIY-0008Qr-VD
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 22:45:51 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QRsFR-0007Xk-F5 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 13:42:37 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 1 Jun 2011 13:39:03 -0700
Received: from [172.30.80.84] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 1 Jun 2011 13:42:36 -0700
Message-ID: <4DE6A43A.3050401@mentor.com>
Date: Wed, 1 Jun 2011 13:42:34 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1306931844.git.dexuan.cui@intel.com>	<4DE67440.1020405@mentor.com>
	<1306950977.27470.461.camel@rex>	<4DE69582.2090508@mentor.com>
	<1306958729.3119.3.camel@lenovo.internal.reciva.com>
In-Reply-To: <1306958729.3119.3.camel@lenovo.internal.reciva.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 01 Jun 2011 20:39:03.0063 (UTC)
	FILETIME=[F1802A70:01CC209B]
Subject: Re: [RFC v1 PATCH 00/16] populate perl-native into its own	directory
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
X-List-Received-Date: Wed, 01 Jun 2011 20:45:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/01/2011 01:05 PM, Phil Blundell wrote:
> On Wed, 2011-06-01 at 12:39 -0700, Tom Rini wrote:
>> Maybe race isn't quite the right word.  But recipe A depends on
>> lib$something-perl-native, and brings in perl-native.  It also checks
>> for perl in its auto-foo and finds our perl.  It now also uses our perl
>> when it wants a host perl and all of the potential bad things happen, yes?
> 
> What are the circumstances in which it would want a host perl?  I don't
> quite understand the issue here.  Surely anything that the host perl can
> do, perl-native plus some combination of libfoo-perl-native can also do,
> right?

So, here's the two things going on:
- In some cases (libfoo-perl-native) we need to install various perl
modules in order to build other target apps.  This is the cpan case,
iirc.  We don't currently (and can't?) just play whatever games perl
would like to do to use system-wide perl and a local to TMPDIR cpan
directory.  We instead go down the path of having perl-native.
- In order to build perl for the target we need to have the same perl
version available for use.

What we do in oe-core (and oe.dev, historically) is provide perl-native
for both of these cases.  What falls down in this case is that  once
perl-native is built (and in our PATH), if it's a different version than
system-wide perl, stuff starts failing on version mis-match.  The patch
series here fixes that by saying stuff must opt-in to having perl-native
be in PATH rather than just system-wide perl.  What I'm saying is that
while in oe-core nothing falls down here (since nothing that gets
perl-native also tries to just run 'perl') meta-oe is or will have failures.

Unfortunately I don't have the test cases that drove me to make oe.dev
like it is handy but I have a feeling that if we go down this path it
won't be the last we see of the problem, but it might well pop up again.

There is another option here, which is to make perl-native be
perl-cross, live in its own special directory and figure out how to make
a TMPDIR-specific cpan repository available for use by system-wide perl.

-- 
Tom Rini
Mentor Graphics Corporation


