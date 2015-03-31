Return-Path: <mario.goulart@gmail.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id C47956013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 20:33:43 +0000 (UTC)
Received: by qcrf4 with SMTP id f4so11913556qcr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 13:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=+Gef0SO6AMiSeJNwjs/z/S3jFDhzgH23eQ25ePS4UOY=;
	b=kp48ZFDiq5dvQSMbqXPQUWhB8WOfY7eLiCFLold2o+jvgPcNVCjNh15zSt8AktWjpl
	zsEQ+r/KIVyHCNiFJGUv87fJ2pTlwWZX7Mum29Z8240EHFlIaR3O72NXRx0snfMrBMDG
	i7JTqNX10zkJzE0sPxKuB8pWPWBNQFcVBhnZjX2mtwMbEg8Ot5vFxhegdHIZ7RKt8ij+
	5XjuPDnFWJb0JBmoHUkqUddZ1dfHEqI24zjIYDhbRD9taAzpU+NwdU9Dt+8e7q18+DWK
	pxT/78MoZtFsE1QTg/u0GfWp8AVj90fOUojBkXioa67qehoFaG4JRakJmuUQi8lxlrwh
	RoIw==
X-Received: by 10.140.86.199 with SMTP id p65mr50487351qgd.49.1427834024572;
	Tue, 31 Mar 2015 13:33:44 -0700 (PDT)
Received: from email.parenteses.org.gmail.com (email.parenteses.org.
	[198.199.72.94])
	by mx.google.com with ESMTPSA id z67sm10680812qge.7.2015.03.31.13.33.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Mar 2015 13:33:44 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Mark Hatle <mark.hatle@windriver.com>
References: <87d23uibxw.fsf@email.parenteses.org>
	<CAJTo0LYQXRL85iAGW82nATWdZXiCfhCFqQKKd0tC8DBBZvkJew@mail.gmail.com>
	<87wq1xgk2j.fsf@email.parenteses.org> <551AE604.6090804@windriver.com>
Date: Tue, 31 Mar 2015 20:33:41 +0000
In-Reply-To: <551AE604.6090804@windriver.com> (Mark Hatle's message of "Tue,
	31 Mar 2015 13:23:00 -0500")
Message-ID: <87oan8hpp6.fsf@email.parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Ownership issue in package contents
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
X-List-Received-Date: Tue, 31 Mar 2015 20:33:43 -0000
Content-Type: text/plain

Hi Mark,

On Tue, 31 Mar 2015 13:23:00 -0500 Mark Hatle <mark.hatle@windriver.com> wrote:

> On 3/31/15 12:20 PM, Mario Domenech Goulart wrote:
>> 
>> On Tue, 31 Mar 2015 14:50:06 +0100 "Burton, Ross" <ross.burton@intel.com> wrote:
>> 
>>> On 27 March 2015 at 17:31, Mario Domenech Goulart <mario@ossystems.com.br> wrote:
>>>
>>>     Note that, although I run "chown -R foo:foo ${D}${libdir}/foo" in
>>>     the recipe, ./usr/lib/foo/ in the package is owned by root.
>>>     However, its content has the right ownership.
>>>
>>> Looks like a bug in pseudo to me, can you file a bug for that?
>> 
>> Sure.  Filed #7554.
>
> I'd suggest you look at meta/classes/package.bbclass "fixup_perms" function.
>
> The ${D}${libdir} (and above) are "corrected" to be 'root:root' by this
> function.  I don't know why 'foo' would be, but if it's a standard defined
> variable -- or if 'directory walking' is enabled it could end up doing this as well.
>
> The control file for this is in meta/files/fs-perms.txt (unless otherwise
> defined by a distribution or other configuration file.)

Thanks a lot.  You seem to have guided me exactly to what causes the
issue.

>
> Format of the file is:
>
> # The format of this file
> #
> #<path> <mode>  <uid>   <gid>   <walk>  <fmode> <fuid>  <fgid>
...
>
> The default is:
...
> libexecdir	0755 root root false - - -
...

This variable seems to be the cause of problems:

$ bitbake -e foo | grep libexecdir=
export libexecdir="/usr/lib/foo"

As far as I understand, package.bbclass may use a user-configured
permissions table (via FILESYSTEM_PERMS_TABLES), but I'm not sure if
this is the right "fix" for the case in question.  I'd have to hardcode
the owner of /usr/lib/foo to be "foo", but foo may not be available when
packaging other recipes.

Should libexecdir actually be in the `target_path_vars' variable
(package.bbclass)?

Best wishes.
Mario
-- 
http://www.ossystems.com.br

