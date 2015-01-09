Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6146772027
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 16:34:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t09GYbgK017820
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Jan 2015 08:34:38 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Fri, 9 Jan 2015 08:34:37 -0800
Message-ID: <54B0031C.9090504@windriver.com>
Date: Fri, 9 Jan 2015 10:34:36 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CADV-EXEYxztudfc2a4YcGj7HC4AMQaddso5uYPjmv_Wfm-DvvA@mail.gmail.com>
In-Reply-To: <CADV-EXEYxztudfc2a4YcGj7HC4AMQaddso5uYPjmv_Wfm-DvvA@mail.gmail.com>
Subject: Re: DNF package manager instead of SMART for rpm
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
X-List-Received-Date: Fri, 09 Jan 2015 16:34:43 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 1/9/15 5:32 AM, Yevhen Kyriukha wrote:
> Hello,
> 
> I'd like to know if there is a chance to replace python-smart with DNF
> (github.com/rpm-software-management/dnf)?
> DNF already has more features than smart and is well supported (smart
> is kind of dead project).
> I'd like to prepare a set of patches for dnf integration.
> 

Let me start with I'm not against DNF or any other package management system..
but there were reasons that smart was choosen.  If DNF (or another system can
meets the requirements, we should strongly consider it.)

For smart, it was chosen because it was small and compact.  It may not be
feature rich, but it was small.  (Yes it requires python, but unlike other
package management front ends it didn't require C++, Boost, etc.)

I don't know the dependency tree for DNF, but if it's small (python and rpm)
then it certainly meets that criteria.


Smart also had a community that wanted to work with us.  (Small, but it was
there.)  OE uses RPM5 as the default version of rpm.  This is because we need
support for some of the RPM5 features.  RPM5 (and OE) use a 'recommend' as well
as requires mechanism.

This means the package manager has to be able to deal with the RPM5 API.  In the
past the YUM developer community was -actively- against working with RPM5.

This also means that the package manager has to have the ability to deal with
both required and recommended packages.  The packages are handled via 'hints'
(bits) in the required field as to if they are required or recommended.
Recommended items should be sorted the same as required, but if they don't exist
shouldn't cause an error.  (YUM was never able to do this... likely due to the
issue above!)

Finally the rest of the OE system would need to be updated to automatically
generate the proper package feeds for this system.  It's not really difficult,
but it has to work in a cross-compile environment.  So whatever tools can't
embed endian and word size specific fields or problems will be created when the
host and target represent different system types.


With all of the above set.  If you think either DNF, or you will be able to
reconcile that.. I'd love to see the patches.

Work wise, I think the first step is figure out the dependency tree and see if
it's reasonable.  (It likely is.)  The next step is to get it working with both
rpm(4) and rpm5.  [including both iterations of the recommended package types]
And finally to get the filesystem generation (cross) to work properly with the
DNF system.

If you have any question, please ask on the list or find me on IRC.. I can help
explain some of the history and problems we'd encountered (and fixed) in the past.

--Mark

