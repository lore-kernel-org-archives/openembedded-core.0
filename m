Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 956BB77E57
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 14:00:58 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jun 2017 07:00:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,395,1493708400"; d="scan'208";a="117538535"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga005.jf.intel.com with ESMTP; 26 Jun 2017 07:00:57 -0700
Message-ID: <1498486214.31575.90.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Date: Mon, 26 Jun 2017 09:10:14 -0500
In-Reply-To: <1498473175.25895.28.camel@andred.net>
References: <20170623145924.21097-1-git@andred.net>
	<20170626090130.2382.3945@do.openembedded.org>
	<1498473175.25895.28.camel@andred.net>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJzZWxmdGVzdC9hcmNoaXZlcjogYWRkIHRlc3RzIGYuLi4iIGFuZCAyIG1vcmUgKHJldjcp?=
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
X-List-Received-Date: Mon, 26 Jun 2017 14:00:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-06-26 at 11:32 +0100, André Draszik wrote:
> On Mon, 2017-06-26 at 09:01 +0000, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: "selftest/archiver: add tests f..." and 2 more (rev7)
> > Revision: 7
> > URL   : https://patchwork.openembedded.org/series/7443/
> > State : failure
> > 
> > == Summary ==
> > 
> > 
> > Thank you for submitting this patch series to OpenEmbedded Core. This is
> > an automated response. Several tests have been executed on the proposed
> > series by patchtest resulting in the following failures:
> > 
> > 
> > 
> > * Issue             Series does not apply on top of target branch
> > [test_series_merge_on_head] 
> >   Suggested fix    Rebase your series on top of targeted branch
> >   Targeted branch  master (currently at 20b3574749)
> 
> I'm not sure why this is failing, I made sure to rebase onto 20b3574749
> before submitting.
> 

I tried merging it with verbose flags and this is what I get:



 git apply --check 7443.mbox --verbose
Checking patch meta/classes/copyleft_filter.bbclass...
Checking patch meta/lib/oeqa/selftest/cases/archiver.py...
Checking patch meta/classes/copyleft_filter.bbclass...
error: while searching for:
    import oe.license
    from fnmatch import fnmatchcase as fnmatch

    included, motive = False, 'recipe did not match anything'

    recipe_type = d.getVar('COPYLEFT_RECIPE_TYPE')
    if recipe_type not in oe.data.typed_value('COPYLEFT_RECIPE_TYPES',
d):
        include, motive = False, 'recipe type "%s" is excluded' %
recipe_type

    include = oe.data.typed_value('COPYLEFT_LICENSE_INCLUDE', d)
    exclude = oe.data.typed_value('COPYLEFT_LICENSE_EXCLUDE', d)

    try:
        is_included, reason =
oe.license.is_included(d.getVar('LICENSE'), include, exclude)
    except oe.license.LicenseError as exc:
        bb.fatal('%s: %s' % (d.getVar('PF'), exc))
    else:
        if is_included:
            if reason:
                included, motive = True, 'recipe has included licenses:
%s' % ', '.join(reason)
            else:
                included, motive = False, 'recipe does not include a
copyleft license'
        else:
            included, motive = False, 'recipe has excluded licenses: %s'
% ', '.join(reason)

    if any(fnmatch(d.getVar('PN'), name) \
            for name in oe.data.typed_value('COPYLEFT_PN_INCLUDE', d)):

error: patch failed: meta/classes/copyleft_filter.bbclass:47
error: meta/classes/copyleft_filter.bbclass: patch does not apply


so there is something that git does not like on the bbclass.

Leo



> 
> Cheers,
> Andre'
> 



