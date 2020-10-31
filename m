Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.5941.1604178401277614869
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 14:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pskxp8ih;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: andrey.z@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id d24so10712558ljg.10
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 14:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qllrmLWUGNym9kpQ0CdB5j1JAtFB/kbAzlnBZ4maxys=;
        b=Pskxp8ihh5Pnl3Bs0hx+0JVlvxfqfkKzWBgldsWT3N6Uarm7EGRKodmz2HhbRYf+O+
         pcZFR4O314zM/qBFbBExotH12jF9jYbaN1AamSjm/uE2QJ/UoARTQJa0pDx8E7f6y7a1
         ThZUeWsSR94rzUvH1d/QtFmGPOtMBN+3B4JPwOEOtF8Si1FKx8n2xFO05ruj+Dcj453O
         +64ZQ9z49zXCxXFT+XSthNBT6qRIzcf9CUqpRpf7d482sHGtbvoo8oIcfdtoJopPBXmP
         yBWIS+G7i0ED8g2JNv7EAMlRESkd7vcsJVq8FRZCyLtIe40NWfs63RTTL7SxDaZYGQmL
         vUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qllrmLWUGNym9kpQ0CdB5j1JAtFB/kbAzlnBZ4maxys=;
        b=TNW33dx0igakLXWUBM0TQIlr5StXFJYQxmTH055pS8Lvg+2D/9NR5WgEwuf0LmMsjy
         ja/2udThRks2bPthdilzwobove15qWQAvissUP6Q7NN6w+M3I9S3iMzKaxV6wyKDBpJO
         65AUHML8wJdmfUcSXdsF+xhJPiCqFuYGXNrDh0kOPc6Mc4o3sXDv8kEFaIuUxEpHhYNC
         WE7dRXxt9ydcoVGaCjQlzoN9M9G18iNENt5wP+14k84O5fCqYoM/aKJcqfn+mF2VvLDT
         fgz6fGZ98dZ+MqUk4Evk5MGugKZ1eSl8MMXjnS88mWF9Ute1ly2nhl2DPNxgnaeyp7LL
         1gTA==
X-Gm-Message-State: AOAM532e2rBXE9eWMjgmW+P+Gwt1t23Gg9+glr3tK1Gzjc/yNM/aBIEx
	2JVyggYcX9+ObtxbaWhcCDnAaADE33Jz/10/Zxo=
X-Google-Smtp-Source: ABdhPJyNvlkFsEtkpnrGmJ3wLdlUlUVHtVGLSHUY8WuljurJO8Wyo9rGHyo5JdW8ijMWpi8Vlv0WcsAQyn0yt/ClU+M=
X-Received: by 2002:a2e:4541:: with SMTP id s62mr3818543lja.128.1604178399437;
 Sat, 31 Oct 2020 14:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201031204709.22065-1-andrey.zhizhikin@leica-geosystems.com> <CANNYZj_AdtSWo8xjCV6EYoD8xZ40L6khosv8r-XF6iLAkmYYLQ@mail.gmail.com>
In-Reply-To: <CANNYZj_AdtSWo8xjCV6EYoD8xZ40L6khosv8r-XF6iLAkmYYLQ@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Sat, 31 Oct 2020 22:06:27 +0100
Message-ID: <CAHtQpK5A18nXRZZSAr2YXj2dvE8aztnVDyZxSsLEJBkNTNQy3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] insane: add GitLab /archive/ tests
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>, 
	Martin Jansa <martin.jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 31, 2020 at 9:56 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Has this been tested?
>
> >>> print(re.search(r"github|gitlab\.com/.+/.+/archive/.+", "github/random/url/will/match"))
> <re.Match object; span=(0, 6), match='github'>

Was actually writing the reply to hold this one off - it gives a lot
of false positives, messed up the 're'... :\

Would come up with V2 for this one, sorry for that...

>
> Alex
>
> On Sat, 31 Oct 2020 at 21:47, Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>>
>> Archives produced by GitLab should be avoided in the same way as those
>> produced by GitHub.
>>
>> Extend SRC_URI check to include GitLab and inform user that recipe
>> should be converted to use git protocol.
>>
>> Link: https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg73109.html
>> Link: https://lists.openembedded.org/g/openembedded-core/message/144035
>> Cc: Martin Jansa <martin.jansa@gmail.com>
>> Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
>> ---
>>  meta/classes/insane.bbclass | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
>> index c6dff9659c..66c34abc95 100644
>> --- a/meta/classes/insane.bbclass
>> +++ b/meta/classes/insane.bbclass
>> @@ -976,8 +976,8 @@ def package_qa_check_src_uri(pn, d, messages):
>>          package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % pn, d)
>>
>>      for url in d.getVar("SRC_URI").split():
>> -        if re.search(r"github\.com/.+/.+/archive/.+", url):
>> -            package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub archives" % pn, d)
>> +        if re.search(r"github|gitlab\.com/.+/.+/archive/.+", url):
>> +            package_qa_handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol" % pn, d)
>>
>>  QARECIPETEST[unhandled-features-check] = "package_qa_check_unhandled_features_check"
>>  def package_qa_check_unhandled_features_check(pn, d, messages):
>> --
>> 2.17.1
>>
>>
>> 
>>


-- 
Regards,
Andrey.
