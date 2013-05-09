Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UaRnJ-0006wZ-Kh for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 16:26:06 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UaRVq-00083O-VS; Thu, 09 May 2013 16:08:03 +0200
Message-ID: <1368108482.14512.397.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Thu, 09 May 2013 15:08:02 +0100
In-Reply-To: <CAMZjud2TzEqknP_0wH=CdAjvrz1MRXgfKRo+ytC1h+mOEXCYJg@mail.gmail.com>
References: <1368104132-30116-1-git-send-email-bogdan.a.marinescu@intel.com>
	<1368105605.16243.65.camel@pb-ThinkPad-R50e>
	<CAMZjud2TzEqknP_0wH=CdAjvrz1MRXgfKRo+ytC1h+mOEXCYJg@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc: include libgcc when libpthread is enabled
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
X-List-Received-Date: Thu, 09 May 2013 14:26:13 -0000
Content-Type: multipart/alternative; boundary="=-4DbOh2McianO0E6WU9Ku"

--=-4DbOh2McianO0E6WU9Ku
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-09 at 16:28 +0300, Marinescu, Bogdan A wrote:

> It's not exactly unconditional, it is conditioned by 'nptl' in
> ${GLIBC_ADDONS}. 


Well, true, but nptl is more or less mandatory nowadays.  That
conditional is an artifact from the days when linuxthreads was the
default and you had to enable nptl explicitly if you were lucky enough
to be using an architecture where it was supported.  I'm not sure if
linuxthreads even still works and I doubt anybody is building eglibc
without nptl any more.

In fact, the whole GLIBC_ADDONS variable appears to be vestigial and, as
far as I can tell, no longer does anything useful.  EXTRA_OECONF in
eglibc.bb is hard-coded to pass just "--enable-add-ons" which causes
eglibc to enable all the add-ons it can find (and even this is
unnecessary since that is the default behaviour anyway). 


> I don't know of a better way to handle this, please let me know if you
> have any suggestions.

There was some previous discussion of how to detect the precise
situation that caused libgcc_s to be required, though my recollection of
all the details is a bit hazy.  I'll see if I can find it in the
archives.  

In the meantime, it's maybe worth noting that the whole way that eglibc
is packaged is basically unchanged from the way that it was first done
back in 2003 and, to put it bluntly, is teh suck.  (Notably, eglibc.inc
mentions LEAD_SONAME, which is usually quite a clear sign that suckage
can be found nearby.)  If libpthread were packaged separately rather
than bundled up into eglibc, the dependency could go there and this
would probably solve 95% of the problem.

p.



--=-4DbOh2McianO0E6WU9Ku
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/4.4.4">
</HEAD>
<BODY>
On Thu, 2013-05-09 at 16:28 +0300, Marinescu, Bogdan A wrote:
<BR>
<BLOCKQUOTE TYPE=CITE>
    It's not exactly unconditional, it is conditioned by 'nptl' in ${GLIBC_ADDONS}. <BR>
</BLOCKQUOTE>
<BR>
Well, true, but nptl is more or less mandatory nowadays.&nbsp; That conditional is an artifact from the days when linuxthreads was the default and you had to enable nptl explicitly if you were lucky enough to be using an architecture where it was supported.&nbsp; I'm not sure if linuxthreads even still works and I doubt anybody is building eglibc without nptl any more.<BR>
<BR>
In fact, the whole GLIBC_ADDONS variable appears to be vestigial and, as far as I can tell, no longer does anything useful.&nbsp; EXTRA_OECONF in eglibc.bb is hard-coded to pass just &quot;--enable-add-ons&quot; which causes eglibc to enable all the add-ons it can find (and even this is unnecessary since that is the default behaviour anyway). <BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
    I don't know of a better way to handle this, please let me know if you have any suggestions.
</BLOCKQUOTE>
<BR>
There was some previous discussion of how to detect the precise situation that caused libgcc_s to be required, though my recollection of all the details is a bit hazy.&nbsp; I'll see if I can find it in the archives.&nbsp; <BR>
<BR>
In the meantime, it's maybe worth noting that the whole way that eglibc is packaged is basically unchanged from the way that it was first done back in 2003 and, to put it bluntly, is teh suck.&nbsp; (Notably, eglibc.inc mentions LEAD_SONAME, which is usually quite a clear sign that suckage can be found nearby.)&nbsp; If libpthread were packaged separately rather than bundled up into eglibc, the dependency could go there and this would probably solve 95% of the problem.<BR>
<BR>
p.<BR>
<BR>
<BR>
</BODY>
</HTML>

--=-4DbOh2McianO0E6WU9Ku--
