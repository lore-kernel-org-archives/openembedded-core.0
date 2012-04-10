Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SHbi1-0004jw-3S
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 16:06:13 +0200
Received: by qcso7 with SMTP id o7so2970724qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=QT3TpjhFyG8TE9K6oWD8O6ECZB2AFO+3Ud/dtRr3qxo=;
	b=Xc+Ktza605HTHrHw+hlQ+vSoUpgpU92BgwVI8KJABXCcru4RkEHP4WmWUNKUjgJri+
	z6SGjvZ7xzz/sf/mlXlsRprF08oJhKd0iO1YTQv1KyeO/xQ1B+1MdyTOoy5qiuYCzKs3
	iXJ7Lul/YPQpe36p2WxW6r33vx/k5ObzeH6Qho9xgpDT8MK87uruRldov6gEyjtFCiUL
	pkwIcVrz/1Rtnj03QWbuX6IUoDBhNr72xsArWsB3673LDmxBDPx6TyuHl0KFy4dRR41n
	VSBhZ1qk/JnQ/kMTFRMtMbLbtVpfJ+OsGLRmx91Q3CKEVn7D6m8kqi0fn/f0moCRbwhs
	kTyQ==
Received: by 10.224.215.10 with SMTP id hc10mr14762060qab.28.1334066214951;
	Tue, 10 Apr 2012 06:56:54 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.79.79 with HTTP; Tue, 10 Apr 2012 06:56:34 -0700 (PDT)
In-Reply-To: <4F843878.2060705@opendreambox.org>
References: <4F843878.2060705@opendreambox.org>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 10 Apr 2012 06:56:34 -0700
X-Google-Sender-Auth: eLXeWOuk2xjNDpd9Uu0bdLWOcDM
Message-ID: <CABcZANnG6rExfpe9=gp--i1BW-0tAT2T9XCb1xfhvd4HFu1GTQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libpython2
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
X-List-Received-Date: Tue, 10 Apr 2012 14:06:13 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 10, 2012 at 6:41 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> "NOTE: multiple providers are available for runtime libpython2 (python,
> python-nativesdk)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match libpython2"
>
> That's because I'm building a recipe for a binary that RDEPENDS_${PN} on
> libpython2. So I added PREFERRED_PROVIDER_libpython2 = "python" to my
> disto.conf, but the warning cited above persists.
>
> python_2.7.2.bb contains:
>
> PACKAGES =+ "lib${BPN}2"
> ...
> BBCLASSEXTEND = "nativesdk"
>
> Shouldn't it rather create libpython2 and libpython2-nativesdk or
> something similar?
>
> What could be the reason for the warning to persist?

Because PREFERRED_PROVIDER_<some runtime provide> = "some recipe" is
invalid. PREFERRED_PROVIDER_ only ever operates against build time
dependencies. The runtime are worked out based on that. If you were to
set something like PREFERRED_PROVIDER_python = "python", it would
probably shut the warning up, as it would see that a preference exists
on a recipe that provides one of the runtime packages, and would
therefore know which to use. Having to rely on this sort of implicit
behavior rather than having a means of explicitly specifying runtime
preferences is a flaw in bitbake, in my opinion.
-- 
Christopher Larson


