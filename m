Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1Rs2op-0007M5-BQ
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 02:47:35 +0100
Received: by bke17 with SMTP id 17so93609bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 17:39:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.204.146.14 with SMTP id f14mr769257bkv.132.1327973982069; Mon,
	30 Jan 2012 17:39:42 -0800 (PST)
Received: by 10.204.35.135 with HTTP; Mon, 30 Jan 2012 17:39:41 -0800 (PST)
X-Originating-IP: [74.41.60.154]
In-Reply-To: <4F272E1A.6040702@linux.intel.com>
References: <1327957970-15159-1-git-send-email-steve@sakoman.com>
	<4F27108D.4090303@linux.intel.com>
	<4F2715ED.9030109@linux.intel.com>
	<CAOSpxdajJLZSuzZS5qb4UPpjuS55ZWB=RR3a0oi9hNDF8J++Fw@mail.gmail.com>
	<4F272E1A.6040702@linux.intel.com>
Date: Mon, 30 Jan 2012 17:39:41 -0800
Message-ID: <CAOSpxdZsOeOWuB5EcjFf5cN6kkMWzAaWXYue5m2OX_jwWQZEfw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 0/3] zypper: support signed repositories
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
X-List-Received-Date: Tue, 31 Jan 2012 01:47:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I took a quick look at the zypper code and discovered that the gpg2
dependency actually comes from the libzypp (package/libzypp.spec
excerpt):

%if 0%{?suse_version}
Requires:       gpg2
%else
Requires:       gnupg2
%endif

That said, the gpg2 utility seems to be quite compatible with gpg
(version 1.x), so we may get away with using an earlier version of
gnupg with GPLv2.

The required patch for libzypp is quite simple:

--- git/zypp/KeyRing.cc-orig	2012-01-30 17:26:49.000000000 -0800
+++ git/zypp/KeyRing.cc	2012-01-30 17:27:57.000000000 -0800
@@ -37,7 +37,7 @@ using namespace zypp::filesystem;
 #undef  ZYPP_BASE_LOGGER_LOGGROUP
 #define ZYPP_BASE_LOGGER_LOGGROUP "zypp::KeyRing"

-#define GPG_BINARY "/usr/bin/gpg2"
+#define GPG_BINARY "/usr/bin/gpg"

 ///////////////////////////////////////////////////////////////////
 namespace zypp

Of course you'll need to import the older gnupg recipe from oe-classic
to test this - not sure I should touch that since I've been poking
through the GPLv3 version of gnupg..

Since the gnupg v2 package has a symlink from gpg to gpg2 the above
patch should work just fine with the new code too.  I'll test &
verify.

Steve


On Mon, Jan 30, 2012 at 3:56 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/30/2012 03:29 PM, Steve Sakoman wrote:
>>
>> On Mon, Jan 30, 2012 at 2:13 PM, Saul Wold<sgw@linux.intel.com> =A0wrote=
:
>>
>>> This would imply that we need to have a GPLv2 Version of the gnupg
>>> recipe also, Steve if you had to look at or handle the newer GPLv3 gnup=
g
>>> code itself, you may not be able to write the GPLv2 recipe or create
>>> patches
>>> for it, can you arrange for someone to create that patch?
>>
>>
>> OE-classic has a recipe for gnupg-1.4.10, so perhaps the safest
>> approach would be to import that recipe since I *have* browsed the
>> gnupg v2 code.
>>
> You mean v3 code no doubt.
>
>
>> I know from experience that signed repositories won't work for that
>> version as-is. =A0Zypper explicitly uses gpg2.
>>
> Any idea how much work there is there? Do you know of anyone that can hel=
p
> out with this?
>
>
>> It *may* be that gpg and gpg2 are compatible enough that you could get
>> away with a symlink and a v1.x version of gnupg. =A0Or perhaps one could
>> patch zypper to try gpg if gpg2 isn't present. =A0Thoughts?
>>
> I think it would be clearer if we patch zypper for gpg instead of hiding
> behind a symlink. =A0Other tools that may want to use gpg2 might get the =
wrong
> thing.
>
> Another possibility would be disable signed repos for non-GPLv3, but I am
> not wild about that idea since it's highly likely that a commercial vendo=
r
> would want to provide signed repos in a non-GPLv3 device for security and
> sanity.
>
> Sau!
>
>
>> Steve
>>
>


