Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qc5FJ-0004TP-Qp
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 02:36:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5U0WvXE028195
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 17:32:57 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 29 Jun 2011 17:32:57 -0700
Message-ID: <4E0BC438.503@windriver.com>
Date: Wed, 29 Jun 2011 19:32:56 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <201106300102.16411.schnitzeltony@gmx.de>
	<BANLkTimEROj5AcR+eYjLVFH2Sh3+0sB04A@mail.gmail.com>
In-Reply-To: <BANLkTimEROj5AcR+eYjLVFH2Sh3+0sB04A@mail.gmail.com>
Subject: Re: How to reuse code in oe-core environment
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
X-List-Received-Date: Thu, 30 Jun 2011 00:36:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 6/29/11 6:59 PM, Chris Larson wrote:
> On Wed, Jun 29, 2011 at 4:02 PM, Andreas Mueller <schnitzeltony@gmx.de> wrote:
>> foo() {
>>        # code to reuse
>> }
>>
>> and called foo from several recipes. In oe-core the run.* scripts are much more
>> stripped of unnecessary.  All the code included by 'require' seems to miss, so
>> the function foo() will not be found.
>>
>> My searches for examples did not lead to a hook so what is the suggested
>> solution for reusing code for multiple recipes in oe-core?
> 
> The require doesn't have to do with anything. bitbake emits only the
> functions which get called somewhere from the task being run. It
> tracks what variables reference what other variables. If you call a
> shell function from another shell function, it tracks this, and
> realizes that both need to be emitted. Either you're doing something
> wrong, or you're doing something in a way that bitbake can't track.
> There's a variable flag you can set to explicitly add variable
> dependencies.

There is an example of how to work around this in the rootfs_rpm.bbclass..  It's
a bit odd, but it has to do with the way the function is called:

        # Workaround so the parser knows we need the resolve_package function!
        if false ; then
                resolve_package_rpm foo ${RPMCONF_TARGET_BASE}.conf || true
        fi


....

        pkg_name=$(resolve_package_rpm $pkg-locale-$lang
${RPMCONF_TARGET_BASE}.conf)


So if the function is called within a subshell, the parser doesn't appear to
know it's there.. so you have to reference it in the function somewhere (the if
false works well for this) in order for it to be available to call.


