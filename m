Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D2657731D2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 20:48:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jun 2016 13:48:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,435,1459839600"; 
	d="scan'208,217";a="970899073"
Received: from jlock-mobl2.ger.corp.intel.com ([10.252.25.208])
	by orsmga001.jf.intel.com with ESMTP; 07 Jun 2016 13:48:32 -0700
Message-ID: <1465332511.3458.33.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Christopher Larson <clarson@kergoth.com>
Date: Tue, 07 Jun 2016 21:48:31 +0100
In-Reply-To: <CABcZANks5WFAtXnvwpgGPp+Uyy2d7Z1VUNoxx6J=wfHFO0Brag@mail.gmail.com>
References: <1465311037-17658-1-git-send-email-joshua.g.lock@intel.com>
	<CABcZANks5WFAtXnvwpgGPp+Uyy2d7Z1VUNoxx6J=wfHFO0Brag@mail.gmail.com>
X-Mailer: Evolution 3.20.2 (3.20.2-1.fc24) 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image: add mechanism to run QA checks on the image once it's built
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
X-List-Received-Date: Tue, 07 Jun 2016 20:48:34 -0000
Content-Type: multipart/alternative; boundary="=-gAIAq+M2ayIUiYBn8TfW"

--=-gAIAq+M2ayIUiYBn8TfW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-06-07 at 08:48 -0700, Christopher Larson wrote:
On Tue, Jun 7, 2016 at 7:50 AM, Joshua Lock <joshua.g.lock@intel.com>
wrote:
> Add a mechanism to run QA checks on a constructed image once it's> 

> complete. All checks will be run with any one failure resulting in> 

> a failed build.> 
> 
> 

> QA checks should be > bitbake>  functions which throw a> 

> NotImplementedError when the check QA fails, with any error> 

> messages passed to the exception.> 
> 
> 

> Specify which checks to run by adding them to IMAGE_QA_COMMANDS.> 
> 
> 

> i.e.> 
> 
> 

> IMAGE_QA_COMMANDS += " \> 

>     image_check_everything_ok \> 

> "> 
> 
> 

> python image_check_everything_ok () {> 

>     raise NotImplementedError('This check always fails')> 

> }> 
> 
> 

> This code is based heavily on the configuration upgrade code in> 

> sanity.> bbclass> .> 
> 
> 

> [YOCTO #9448]> 
> 
> 

> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>

> > Add a mechanism to run QA checks on a constructed image once it's
> > complete. All checks will be run with any one failure resulting in
> > a failed build.
> > 
> > QA checks should be bitbake functions which throw a
> > NotImplementedError when the check QA fails, with any error
> > messages passed to the exception.
> > 
> > Specify which checks to run by adding them to IMAGE_QA_COMMANDS.
> > 
> > i.e.
> > 
> > IMAGE_QA_COMMANDS += " \
> >     image_check_everything_ok \
> > "
> > 
> > python image_check_everything_ok () {
> >     raise NotImplementedError('This check always fails')
> > }
> > 
> > This code is based heavily on the configuration upgrade code in
> > sanity.bbclass.
> > 
> > [YOCTO #9448]
> > 
> > Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> > 
> 
> 
> What's the behavior if your qa function fails with a different
> exception? What if a user writes a shell qa check function, what's
> the behavior? Also, this seems like overloading the purpose of
> NotImplementedError. IMO It'd be cleaner to either use a custom
> exception or re-use python unit testing bits / use assert rather than
> subverting this one to a different purpose.
> 
> 
> 
> 
> 
> What's the behavior if your qa function fails with a different
> exception? What if a user writes a shell qa check function, what's
> the behavior? Also, this seems like overloading the purpose of
> NotImplementedError. IMO It'd be cleaner to either use a custom
> exception or re-use python unit testing bits / use assert rather than
> subverting this one to a different purpose.
> 
> 
> 
Different exceptions to NotImplementedError result in a backtrace… 
The python exception pattern using NotImplementedError I copied from
the configuration upgrade code in sanity.bbclass, because I want to
replicate that same behaviour where the checks are able to pass a
reason back to the task which calls the check functions.
Shell functions are a good point, not least of all because I suspect
many checks could be much more concise with sh.
I'll go back to the drawing board for a more generic solution that
supports both sh and python tasks.
Thanks for the review,
Joshua

--=-gAIAq+M2ayIUiYBn8TfW
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html><head></head><body><div>On Tue, 2016-06-07 at 08:48 -0700, Christopher Larson wrote:</div><div>On Tue, Jun 7, 2016 at 7:50 AM, Joshua Lock <span dir="ltr">&lt;<a href="mailto:joshua.g.lock@intel.com" target="_blank">joshua.g.lock@intel.com</a>&gt;</span> wrote:<br><blockquote type="cite"><div id=":16q" class="a3s aXjCH m1552b5843d6d0f92">Add a mechanism to run QA checks on a constructed image once it's<br>
complete. All checks will be run with any one failure resulting in<br>
a failed build.<br>
<br>
QA checks should be <span class="il">bitbake</span> functions which throw a<br>
NotImplementedError when the check QA fails, with any error<br>
messages passed to the exception.<br>
<br>
Specify which checks to run by adding them to IMAGE_QA_COMMANDS.<br>
<br>
i.e.<br>
<br>
IMAGE_QA_COMMANDS += " \<br>
&nbsp; &nbsp; image_check_everything_ok \<br>
"<br>
<br>
python image_check_everything_ok () {<br>
&nbsp; &nbsp; raise NotImplementedError('This check always fails')<br>
}<br>
<br>
This code is based heavily on the configuration upgrade code in<br>
sanity.<span class="il">bbclass</span>.<br>
<br>
[YOCTO #9448]<br>
<br>
Signed-off-by: Joshua Lock &lt;<a href="mailto:joshua.g.lock@intel.com">joshua.g.lock@intel.com</a>&gt;</div><br></blockquote></div><blockquote type="cite"><div dir="ltr"><div class="gmail_extra"><div class="gmail_extra"><div class="gmail_quote"><blockquote type="cite"><div id=":16q" class="a3s aXjCH m1552b5843d6d0f92">Add a mechanism to run QA checks on a constructed image once it's<br>
complete. All checks will be run with any one failure resulting in<br>
a failed build.<br>
<br>
QA checks should be <span class="il">bitbake</span> functions which throw a<br>
NotImplementedError when the check QA fails, with any error<br>
messages passed to the exception.<br>
<br>
Specify which checks to run by adding them to IMAGE_QA_COMMANDS.<br>
<br>
i.e.<br>
<br>
IMAGE_QA_COMMANDS += " \<br>
&nbsp; &nbsp; image_check_everything_ok \<br>
"<br>
<br>
python image_check_everything_ok () {<br>
&nbsp; &nbsp; raise NotImplementedError('This check always fails')<br>
}<br>
<br>
This code is based heavily on the configuration upgrade code in<br>
sanity.<span class="il">bbclass</span>.<br>
<br>
[YOCTO #9448]<br>
<br>
Signed-off-by: Joshua Lock &lt;<a href="mailto:joshua.g.lock@intel.com">joshua.g.lock@intel.com</a>&gt;</div><br></blockquote></div><br><br><div>What's the behavior if your qa function fails with a different exception? What if a user writes a shell qa check function, what's the behavior? Also, this seems like overloading the purpose of NotImplementedError. IMO It'd be cleaner to either use a custom exception or re-use python unit testing bits / use assert rather than subverting this one to a different purpose.</div><br>
</div><div><br></div><br><br><div>What's the behavior if your qa function fails with a different exception? What if a user writes a shell qa check function, what's the behavior? Also, this seems like overloading the purpose of NotImplementedError. IMO It'd be cleaner to either use a custom exception or re-use python unit testing bits / use assert rather than subverting this one to a different purpose.</div><br>
</div></div>
</blockquote><div><br></div><div>Different exceptions to NotImplementedError result in a backtrace…&nbsp;</div><div><br></div><div>The python exception pattern using NotImplementedError I copied from the configuration upgrade code in sanity.bbclass, because I want to replicate that same behaviour where the checks are able to pass a reason back to the task which calls the check functions.</div><div><br></div><div>Shell functions are a good point, not least of all because I suspect many checks could be much more concise with sh.</div><div><br></div><div>I'll go back to the drawing board for a more generic solution that supports both sh and python tasks.</div><div><br></div><div>Thanks for the review,</div><div><br></div><div>Joshua</div><div><br></div><div><br></div></body></html>

--=-gAIAq+M2ayIUiYBn8TfW--
